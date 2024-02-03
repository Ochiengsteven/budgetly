class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users =  User.all
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
