class DemoController < ApplicationController

  layout 'application'
  def index
  	
  end
  def hello
  	#render('index')
  	@array = [1,2,3,4,5]
  	@id = params['id']
  	@page = params[:page]
  end
  def other_hello
  	redirect_to(:Controller => 'demo' , :action => 'index')
  end
  def lynda
  	redirect_to("http://google.com")
  end
  def text_helpers
    
  end
end
