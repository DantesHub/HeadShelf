module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end

  def set_title
    @page_title = 'BrainStack | Home'
    @seo_keywords = 'success, self-help, notes'
  end
end
