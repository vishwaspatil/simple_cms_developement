class PagesController < ApplicationController
  layout "admin"
  def index
    @pages = Page.sorted
  end

  def show
    @pages = Page.find(params[:id])
  end

  def new
    @pages = Page.new
  end

  def create
    @pages= Page.new(page_params)
    if @pages.save
      flash[:notice]= "Page created successfully"
      redirect_to(:action => 'index')
    else
      render ('new')
    end
  end

  def edit
    @pages = Page.find(params[:id])
  end

  def update
     @pages = Page.find(params[:id])
    if @pages.update_attributes(page_params)
      flash[:notice]= "Page updated successfully"
      redirect_to(:action => 'show', :id => @pages.id)
    else
      render ('edit')
    end
  end

  def delete
     @pages = Page.find(params[:id])
  end

  def destroy
    pages = Page.find(params[:id]).destroy
    flash[:notice]= "Page #{pages.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

   private
  def page_params
    params.require(:pages).permit(:subject_id, :name , :permalink, :position, :visible)
    
  end
end
