class PresentationsController < ApplicationController
  before_action :require_auth
  before_action :set_presentation, only: [:show, :edit, :update, :destroy, :launch]
  before_action :check_access, only: [:launch, :create, :update, :destroy, :edit, :new]


  # GET /presentations
  # GET /presentations.json
  def index
    @presentations = Presentation.for(current_user.id)
    @nearby = Presentation.near(current_user_latlon)
  end

  # GET /presentations/1
  # GET /presentations/1.json
  def show
    add_breadcrumb @presentation.name
  end

  def launch
    @websocket_path = Rails.env == "development" ? "localhost:#{ENV['PORT']}#{websocket_path}" : "twalk.io:443#{websocket_path}"
    # TODO: cleanup this logic. Create model methods for some of this shit
    if @presentation.user_id == current_user.id
      if current_user.party
        current_user.party.destroy
      end
      @party = Party.create(:user => current_user, :presentation => @presentation)
      @presentation_mode = "boss"
      if session[:geolocation]
        @presentation.longitude = session[:geolocation][:longitude].to_f
        @presentation.latitude = session[:geolocation][:latitude].to_f
        @presentation.geolocation_updated_at = session[:geolocation][:updated_at]
        @presentation.geolocation_accuracy = session[:geolocation][:accuracy]
        @presentation.save
      end
    else
      @presentation_mode = "kibitz"
      if @presentation.has_party?
        # need user to join CORRECT party.
        # TODO figure out how to join correct party.
        # can a presentation only have one party at a time?
        # - for now: yes.
        PartyMember.create(:user => current_user, :presentation => @presentation, :role => :participant)
      else

      end
      Fiber.new{
        WebsocketRails["party_#{@presentation.id}"].trigger(:new_client, { :user_id => current_user.id, :nickname => current_user.nickname })
      }.resume
    end
    render :layout => "presentation"
  end

  def nearby
    add_breadcrumb "Nearby", "/nearby"
    @presentations = Presentation.near(current_user_latlon)
  end

  # GET /presentations/new
  def new
    @presentation = Presentation.new :image => current_user.image
  end

  # GET /presentations/1/edit
  def edit
    # redirect_to "/editor/dashboard/#{@presentation.slug}"
  end


  # POST /presentations
  # POST /presentations.json
  def create
    @presentation = Presentation.new(presentation_params)
    @presentation.user = current_user
    
    respond_to do |format|
      if @presentation.save
        format.html { redirect_to presentation_slides_path(@presentation), notice: 'Presentation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @presentation }
      else
        format.html { render action: 'new' }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /presentations/1
  # PATCH/PUT /presentations/1.json
  def update
    respond_to do |format|
      if @presentation.update(presentation_params)
        format.html { redirect_to @presentation, notice: 'Presentation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @presentation.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_presentation
    @presentation = current_user.presentations.friendly.find(params[:presentation_id])
    @presentation.name = params[:content][:presentation_name][:value]
    @presentation.description = params[:content][:presentation_description][:value]

    @presentation.slides.each do |slide|
      unless slide.nil?
        slide.contents.each do |content|
          unless content.nil?
            content.body = params[:content]["presentation_slide_#{slide.slug}_content_#{content.slug}"][:value]
          end
        end
      end
    end

    if @presentation.save!
      render text: ''
    else
      render text: 'ERROR'
    end
  end

  # DELETE /presentations/1
  # DELETE /presentations/1.json
  def destroy
    @presentation.destroy
    respond_to do |format|
      format.html { redirect_to presentations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_presentation
      begin
        @presentation = Presentation.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to '/404.html'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def presentation_params
      params.require(:presentation).permit(:name, :slug, :description, :is_public, :latitude, :longitude, :theme_id, :image)
    end

    def check_access
      # current_user.has_role?(:collaborator, @presentation)
    end
end
