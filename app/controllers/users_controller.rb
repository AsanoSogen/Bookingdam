# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.where.not(image: '', text: '').limit(8).order('RAND()')
  end

  def show
    @books = @user.books.order('created_at DESC')
    @reservation_books = @user.reservation_books
  end

  def edit
    redirect_to user_path(@user) unless @user == current_user
  end

  def update
    if current_user.update(user_params)
      @user.image = "#{current_user.id}.jpg"
      image = params[:image]
      bypass_sign_in(current_user)
      redirect_to users_path
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def search
    return nil if params[:keyword] == ''

    @users = User.where(['nickname LIKE(?)', "%#{params[:keyword]}%"])
    respond_to do |format|
      format.html { redirect_to :root }
      format.json { render 'search.json.jbuilder' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

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
