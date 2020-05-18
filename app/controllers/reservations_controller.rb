class ReservationsController < ApplicationController

  before_action :set_book

  def index
    @reservations = @books.reservations.includes(:user)
  end
  
  def create
    @reservation = @book.reservations.create(reservation_params)
    redirect_to root_path notice:"予約が完了しました"
  end

  private

  def reservation_params
    params.permit(:book_id, :user_id).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
