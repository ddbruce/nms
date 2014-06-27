class SectionsController < ApplicationController

  def index
    @sections = Section.all
  end

  def show
    @articles = Article.where(section_id: params[:id])
  end

  def toggle_visibility
    @section = Section.find(params[:section_id])

    if @section.is_active
      @section.is_active = false
    else
      @section.is_active = true
    end

    @section.save

    redirect_to sections_path
  end

  def create
    section = Section.new(section_params)

    if section.save
      redirect_to sections_path
    else
      flash[:error] = "Unable to save section"
      redirect_to sections_path
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      redirect_to sections_path
    else
      flash[:error] = "Unable to save changes to section #{@section.title}"
      redirect_to sections_path
    end
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy

    redirect_to sections_path
  end

  private

    def section_params
      params.require(:section).permit(:title)
    end

end
