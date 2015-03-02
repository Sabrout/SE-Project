class SessionsController < ApplicationController

def create
User.create(uname: params[:signup][:uname] ,password: params[:signup][:password],
            fname: params[:signup][:fname] ,lname: params[:signup][:lname] ,
            email: params[:signup][:email] ,phone: params[:signup][:phone] ,  )
      redirect_to '/'
end         

def view_signup

end
def view_signin

end

def login
user = User.find_by(uname: params[:session][:uname])
if user && user.authenticate(params[:session][:password])
log_in(user)
params[:session][:remember_me] == true ? remember(user) : forget(user)
flash[:success] = 'Welcome To KnellenArts , Please Check Your Email Account to Activate Your Knellen Account'
else
flash[:error] = 'Invalid Username/password combination'
end
if logged_in?
	redirect_to '/'
else
    render 'view_signin'
end

end


def logout
	log_out if logged_in?
	redirect_to '/'
end

end