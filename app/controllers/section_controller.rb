class SectionController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  before_action :find_section
  
  def index
   
   @sections = @page.sections.sorted

  end

  def show
      @sections = Section.find(params[:id])
  end

  def new
    @sections = Section.new({:page_id => @page.id})
    @section_count = Section.count
    @pages = Page.order('position ASC')
  end

  def create
    @sections = Section.new(section_params)
    @pages = Page.order('position ASC')
    if @sections.save
      flash[:notice]= "section created successfully"
      redirect_to(:action => 'index',:page_id => @page.id)
    else
      @section_count = Section.count

      render ('new')
    end
  end

  def edit
    @sections = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.order('position ASC')
  end

  def update
     @sections = Section.find(params[:id])
    if @sections.update_attributes(section_params)
      flash[:notice]= "Section updated successfully"
      redirect_to(:action => 'show', :id => @sections.id, :page_id => @page.id)
    else
      @section_count = Section.count
      @pages = Page.order('position ASC')
      render ('edit')
    end
  end



  def destroy
     sections = Section.find(params[:id]).destroy
    flash[:notice]= "Section #{sections.name} destroyed successfully"
    redirect_to(:action => 'index', :page_id => @page.id)
  end 
   def delete
    @sections = Section.find(params[:id])
  end

  private
  def section_params
    params.require(:sections).permit(:page_id, :name ,:position,:visible, :content_type, :content )
    
  end

  def find_section
    if params[:page_id]
      @page = Page.find(params[:page_id])
    end

  end

end

