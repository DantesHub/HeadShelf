class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy toggle_status]
  access all: %i[show index], user: { except: %i[destroy new update edit toggle_status] }, site_admin: :all

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.page(params[:page]).per(5)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  def toggle_status
    if @article.draft?
      @article.published!
    else
      @article.draft!
    end
    redirect_to articles_url, notice: 'Post status has been updated.'
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      puts 'fasdfasdfasdfsfsafsdafasdfasdffsfoasufhuisdbgfisdbfiusdb'

      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :body, :image, :tag_list)
  end
end
