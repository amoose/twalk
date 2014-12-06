class ContentsController < ApplicationController
  before_action :set_presentation_and_slide
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = @slide.contents
    redirect_to new_presentation_slide_content_path(@presentation, @slide) unless @contents.any?

    add_breadcrumb "Slide #{@slide.sort_order} Contents"
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    # render :layout => 'presentation'
  end

  # GET /contents/new
  def new
    @content = Content.new(
        :body => '<h1>New Content</h1>',
        :sort_order => @slide.contents.size + 1,
        :presentation_id => @presentation.id,
        :slide_id => @slide.id,
        :content_type => ContentType.default
      )

    if @content.save
      edit
    else
      flash[:error] = "ERROR"
    end
  end

  # GET /contents/1/edit
  def edit
    redirect_to "/editor" + presentation_slide_path(@presentation, @slide)
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    @content.presentation_id = @presentation.id
    @content.slide_id = @slide.id
    
    respond_to do |format|
      if @content.save
        format.html { redirect_to presentation_slide_content_path(@presentation, @slide, @content), notice: 'Content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @content }
      else
        format.html { render action: 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    binding.pry
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to presentation_slide_content_path(@presentation, @slide, @content), notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to presentation_slide_contents_url(@presentation, @slide) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = @slide.contents.friendly.find(params[:id])
      @content_types = ContentType.all
    end

    def set_presentation_and_slide
      @presentation = current_user.presentations.friendly.find(params[:presentation_id])
      @slide = @presentation.slides.friendly.find(params[:slide_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:body, :content_type_id, :sort_order)
    end
end
