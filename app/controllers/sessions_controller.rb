class SessionsController < ApplicationController
  skip_before_filter :authenticate
  
  def new
    @title = "Sign in"
    #@session = Session.new      # since there's no model, we can't setup the form automatically...
    #@session.email 
  end

  def create                                         # we get here by clicking the submit button on the sessions/new.html.erb form
    email = default_email

    user = User.authenticate(email,  
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
  
  def default_email
    email = params[:session][:email]
    unless email.include?('@') 
      email += "@excelsiorcarpetone.com"
    end
    return email
  end
end
