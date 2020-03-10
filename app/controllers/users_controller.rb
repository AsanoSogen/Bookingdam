class UsersController < ApplicationController
  before_action :save_new_to_session, only: :step

  def index

  end

  def new
    
    @user = User.new
    @user.build_address
  
  end

  def show
    @user = User.find(params[:id])
  end

  def save_new_to_session
    session[:user_params] = user_params
    @user = User.new(session[:user_params])
    render new_user_path unless @user.valid?
  end 

  def step
    @user = User.new(session[:user_params])
    @user.build_address
  end

  def create
    @user = User.new(session[:user_params])  # ここでuserモデルのsessionを引数で渡す。
    @user.build_address(session[:address_attributes_after_step])
    @user.build_address(user_params[:address_attributes])  # 今回のビューで入力された情報を代入。
    binding.pry
    if @user.save
      session[:id] = @user.id  #ここでidをsessionに入れることでログイン状態に持っていく。
      redirect to user_path
    else
      render step_users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password, 
      :password_confirmation,
      address_attributes: [:id, :phone_number, :postal_code, :prefectures, :municipalities, :address, :building]
    )
  end

    

end
