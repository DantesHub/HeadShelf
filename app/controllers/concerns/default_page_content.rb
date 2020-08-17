module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = 'BrainStack | Books'
    @seo_keywords = 'success, self-help, notes'
    @books_preview = 'bing'
    @books_image = 'bing'
    @books_url = 'bing'
    @article_url = 'bing'
    @artilcle_image = 'bing'
    @article_preview = 'bing'
    @article_page_title = 'Brainstack | Articles'
  end
end
