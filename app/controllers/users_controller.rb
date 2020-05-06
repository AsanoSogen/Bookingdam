class UsersController < ApplicationController
  before_action :ensure_correct_user, only: :show



  def index
    # @user = User.find(params[:id])
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
    @user.update(user_params)
    if @user.save
      @user.image="#{@user.id}.jpg"
      image=params[:image]
    end
    
    redirect_to user_path(@user)
  end

  def search
    return nil if params[:keyword] == ""
    @users = User.where(['nickname LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(15)
    respond_to do |format| 
      format.json { render 'index', json: @users } #json形式のデータを受け取ったら、@usersをデータとして返す そしてindexをrenderで表示する
    end
  end
  
  private
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password, 
      :password_confirmation,
      :image,
      :text,
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
