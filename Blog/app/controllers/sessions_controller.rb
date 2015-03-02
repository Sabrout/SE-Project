class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(uname: params[:session][:uname])
  	if(user&&user.authenticate(params[:session][:password]))
  		log_in(user)
  		redirect_to '/' , :flash => {:notice =>"Welcome #{user.uname}"}
  	else
  		redirect_to '/' , :flash => {:error => 'Invalid email/password combination'}
  	end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
