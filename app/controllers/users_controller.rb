class UsersController < ApplicationController
  before_action :ensure_correct_user, only: :show

  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # if @user.update(user_params)
      # @host_user.image="#{@host_user.id}.jpg"
      # image=params[:image]
    # end

    redirect_to host_user_path(@host_user)
  end

  
  private
  def user_params
      params.require(:user).permit(
          :nickname,
          :email,
          :password, 
          :password_confirmation,
          address_attributes: [:id, :phone_number, :postal_code, :prefectures, :municipalities, :address, :building]
      )
  end

  def ensure_correct_user
    if user_signed_in? && current_user.id

    else
      redirect_to root_path, notice: "権限がありません"
    end
  end


end
