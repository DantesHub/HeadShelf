class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy toggle_status]
  access all: %i[show index], user: { except: %i[destroy new update edit] }, site_admin: :all
  layout 'book'
  # GET /books
  # GET /books.json
  def index
    @books = if logged_in?(:site_admin)
               Book.recent.all
             else
               Book.recent.published
             end
    @page_title = 'BrainStack | Books'
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @page_title = @book.title
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
    end
  end

  def toggle_status
    if @book.draft?
      @book.published!
    else
      @book.draft!
    end

    redirect_to books_url, notice: 'Post status has been updated.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.friendly.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:title, :author, :body, :tag_list)
  end
end
