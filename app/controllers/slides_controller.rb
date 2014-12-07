class SlidesController < ApplicationController
  before_action :set_presentation
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  # GET /slides
  # GET /slides.json
  def index
    @slides = @presentation.slides.order(sort_order: :asc)
    redirect_to new_presentation_slide_path(@presentation) unless @slides.any?
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
    add_breadcrumb 'Edit', edit_presentation_slide_content_path(@presentation, @slide, @slide.contents.first) unless params[:mercury_frame]
    add_breadcrumb 'New Slide', new_presentation_slide_path(@presentation)
    render :layout => 'presentation'
    @contents = @slide.contents
  end

  # GET /slides/new
  def new
    @slide = Slide.create(:presentation_id => @presentation.id, :sort_order => @presentation.slides.count + 1)
    redirect_to new_presentation_slide_content_path(@presentation,@slide)
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = Slide.new(slide_params)
    @slide.presentation = @presentation

    respond_to do |format|
      if @slide.save
        format.html { redirect_to location: presentation_slides_url(@presentation), notice: 'Slide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @slide }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    respond_to do |format|
      @content = @slide.contents.first
      @content.body = slide_params[:mercury_content][:value]
      if @content.save
        format.html { redirect_to presentation_slide_url(@presentation, @slide), notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = @presentation.slides.friendly.find(params[:id])      
      add_breadcrumb @slide.slug, presentation_slide_path(@presentation, @slide)
    end

    def set_presentation
      @presentation = current_user.presentations.friendly.find(params[:presentation_id])
      add_breadcrumb "Dashboard", :presentations_url
      add_breadcrumb @presentation.name, presentation_path(@presentation)
      add_breadcrumb 'Slides', presentation_slides_path(@presentation)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      valid_params = params.require(:content).permit(:mercury_content => [:value, :snippets, :data, :type])
      valid_params[:presentation_id] = @presentation.id
      valid_params
    end
end
