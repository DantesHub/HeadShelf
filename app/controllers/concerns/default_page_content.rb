module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = 'BrainStack | Books'
    @seo_keywords = 'success, self-help, notes'
    @books_preview = 'bing'
    @books_image = 'https://brainstack.s3.us-east-2.amazonaws.com/uploads/titan/thumb_image/1/brainstack_logo.png'
    @books_url = 'bing'
    @article_url = 'bing'
    @artilcle_image = 'bing'
    @article_preview = 'Looking for some of the best articles to read? Want to more knowledge, instead of more information? Then you have come to the right place'
    @article_page_title = 'Brainstack | Articles'
  end
end
