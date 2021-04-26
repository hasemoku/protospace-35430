class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  def show
    @user = User.find(params[:id])
    @name = @user.name
    @prototypes = @user.prototypes
  end
end
