class UsersController < ApplicationController

def new
    @user = User.new  # params? 
    render :new
end

def create

end





end