class BooksController < ApplicationController

  before_action :set_user, except: [:show, :create,:new]

  def index
    @books = Book.includes(:user)
  end
  
  def new
    @book = Book.new
  end

  def show
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    if @book = Book.create(book_params)
      @book.image = "#{@book.id}.jpg"  
      image=params[:image] 
    else
      render :new
    end
    redirect_to user_path(current_user), notice: " #{@book.title} を登録しました"
  end
  
  def update
      @book = Book.find(params[:id])
      if @book.update_attributes(book_params)
      redirect_to books_path, notice: "#{@book.title} を更新しました。"
      else
      render :edit
      end
  end
  
  private
  
  def book_params
    params.permit(:title, :text, :image, :published_at, :end_day).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:current_user_id])
  end
end
