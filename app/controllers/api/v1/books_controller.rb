# frozen_string_literal: true

class Api::V1::BooksController < ActionController::API
  def show
    @book = Book.find(params[:id])
    @users = @book.reservation_users
  end

  private

  def book_params
    params.permit(:title, :text, :image, :published_at, :end_day, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
