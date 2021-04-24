class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_prototype, only: [:show, :edit, :destroy, :update]
  before_action :move_to_index, only: [:update, :edit, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
  end

  def update
    @prototype.update(prototype_params)
    if @prototype.update(prototype_params)
      redirect_to prototype_path method: :show
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :image, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to root_path
    end
  end
end

