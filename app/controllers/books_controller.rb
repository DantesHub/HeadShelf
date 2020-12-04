class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy toggle_status]
  access all: %i[show index], user: { except: %i[destroy new update edit] }, site_admin: :all, admin: :all
  layout 'book'
  # GET /books
  # GET /books.json
  def index 
    @books = if !logged_in?(:site_admin) && !logged_in?(:admin)  
            if !params[:category].nil?
                 Book.category(params[:category]).recent.published
                 @category =  params[:category].to_s
                 redirect_to articles_path
               else
                 Book.favorite.recent.published
             end
             else
              puts "************************************************"
               if !params[:category].nil?
                @category =  params[:category].to_s
                 Book.category(params[:category]).recent.all
               else
                Book.favorite.recent.all
              end
    end
    @page_title = 'BrainStack | Book '
    @seo_keywords = 'book notes, book summaries'
    @books_preview = 'Timeless knowledge, advice and wisdom to help you become better than you were yesterday. Book notes and summaries to help you remember and understand what you read'
    @books_url = request.original_url
  #  if params[:category].nil?
  #   @category = "Favorite" 
  #  end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    if logged_in?(:site_admin) || @book.published?
      @page_title = @book.title
      @books_preview = @book.preview
      @books_image = @book.thumb_image
      @books_url = request.original_url
      @book_categories = @book.tag_list
      @seo_keywords = @book.title
    else
      redirect_to books_path, notice: 'You are not authorized to access this page'
  end
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
    params.require(:book).permit(:title, :author, :body, :thumb_image, :tag_list, :buy_link, :preview, :status)
  end
end
