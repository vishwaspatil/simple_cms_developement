class AdminUserController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in
  def index
     @adminuser = AdminUser.sorted
  end

  def new
     @adminuser = AdminUser.new
    @admin_count = AdminUser.count + 1
  end

  def create
     @adminuser = AdminUser.new(adminuser_params)
    if @adminuser.save
      flash[:notice]= "admin created successfully"
      redirect_to(:action => 'index')
    else
      @admin_count = AdminUser.count + 1
      render ('new')
    end
  end

  def edit
     @adminuser = AdminUser.find(params[:id])
     @admin_count = AdminUser.count
  end

  def update
    @adminuser = AdminUser.find(params[:id])
    if @adminuser.update_attributes(adminuser_params)
      flash[:notice]= "Admin User updated successfully"
      redirect_to(:action => 'index', :id => @adminuser.id)
    else
      @admin_count = AdminUser.count
      render ('edit')
    end
  end

  def delete
    @adminuser = AdminUser.find(params[:id])
  end

  def destroy
    adminuser = AdminUser.find(params[:id]).destroy
    flash[:notice]= "admin #{adminuser.first_name} destroyed successfully"
    redirect_to(:action => 'index')
  end

 
  private
  def adminuser_params
    params.require(:adminuser).permit(:first_name , :last_name, :Email, :username, :password)    
  end
end
