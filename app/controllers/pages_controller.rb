class PagesController < ApplicationController

  layout "admin"

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new(:name => "Default Page")
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created sucessfully"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Failed to create page"
      render('new')
    end    
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page udpated sucessfully!"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Could not update page"
      render('show')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Destroyed page: #{@page.name} sucessfully."
    redirect_to(:action => 'index')
  end

  private
  def page_params
    params.require(:page).permit(:name,:position,:visible,:permalink,:subject_id)
  end

end
