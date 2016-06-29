class SectionController < ApplicationController
  def index
      @sections = Section.sorted
  end

  def show
      @sections = Section.find(params[:id])
  end

  def new
    @sections = Section.new
  end

  def create
    @sections = Section.new(section_params)
    if @sections.save
      flash[:notice]= "section created successfully"
      redirect_to(:action => 'index')
    else
      render ('new')
    end
  end

  def edit
    @sections = Section.find(params[:id])
  end

  def update
     @sections = Section.find(params[:id])
    if @sections.update_attributes(section_params)
      flash[:notice]= "Section updated successfully"
      redirect_to(:action => 'show', :id => @sections.id)
    else
      render ('edit')
    end
  end

  def delete
    @sections = Section.find(params[:id])
  end

  def destroy
     sections = Section.find(params[:id]).destroy
    flash[:notice]= "Section #{section.name} destroyed successfully"
    redirect_to(:action => 'index')
  end

   private
  def section_params
    params.require(:sections).permit(:page_id, :name ,:position,:visible, :content_type, :content )
    
  end
end
