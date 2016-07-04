class AccessController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
  
  end

  def login

  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
  		found_user = AdminUser.where(:username => params[:username]).first
  		if found_user 
  			authorized_user = found_user.authenticate(params[:password]) 
  		end
  	end
  	if authorized_user
  		session[:id] =  authorized_user.id
  		session[:username] = authorized_user.username
	  	flash[:notice] = "You are now logged in."
	  	redirect_to(:action => 'index')
	else		
  		session[:id] =  nil
  		session[:username] = nil
	  	flash[:notice] = "Invalid username/password combination."
	  	redirect_to(:action => 'login')
  	end
  end


  def logout
     	flash[:notice] = "logged out."
  	redirect_to(:action => 'login')
  end


end