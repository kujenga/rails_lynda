class SectionsController < ApplicationController

  layout false

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:name => "Default Section")
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created sucessfully"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Failed to create section"
      render('new')
    end    
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section udpated sucessfully!"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Could not update section"
      render('show')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Destroyed section: #{@section.name} sucessfully."
    redirect_to(:action => 'index')
  end

  private
  def section_params
    params.require(:section).permit(:name,:position,:visible,:content,:content_type)
  end

end
