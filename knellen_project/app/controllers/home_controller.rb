class HomeController < ApplicationController

def index
 @current_user = User.find_by(session[:user_id])
end

end
