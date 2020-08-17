module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = 'BrainStack | Home'
    @seo_keywords = 'success, self-help, notes'
    @books_preview = 'bing'
    @books_image = 'bing'
    @books_url = 'bing'
  end
end
