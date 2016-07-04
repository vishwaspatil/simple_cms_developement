class PagesController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  
  def index
    @pages = Page.sorted
  end

  def show
    @pages = Page.find(params[:id])
    
  end

  def new
    @pages = Page.new
    
    @subjects = Subject.order('position ASC')
    @page_count = Page.count + 1
  end

  def create
    @pages= Page.new(page_params)
    if @pages.save
      flash[:notice]= "Page created successfully"
      redirect_to(:action => 'index')
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count + 1
      render ('new')
    end
  end

  def edit
    @pages = Page.find(params[:id])
   
    @subjects = Subject.order('position ASC')
    @page_count = Page.count

  end

  def update
     @pages = Page.find(params[:id])
    if @pages.update_attributes(page_params)
      flash[:notice]= "Page updated successfully"
      redirect_to(:action => 'show', :id => @pages.id)
    else
      @subjects = Subject.order('position ASC')
      @page_count = Page.count
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
