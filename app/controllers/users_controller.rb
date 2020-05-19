class UsersController < ApplicationController

  def index
    # @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.order("created_at DESC")
    @reservation_books = @user.reservation_books
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
    @users = User.where(['nickname LIKE(?)', "%#{params[:keyword]}%"] )
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render 'search.json.jbuilder' }
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
end

