module BooksHelper
  def image_generator(height:, width:)
    "https://placehold.it/#{height}x#{width}"
  end

  def book_img(_img)
    if !_img.nil?
      _img
    else
      image_generator(height: '100', width: '100')
    end
  end

  def buy(link)
    if !link.nil?
      link
    else
      'amazon.com'
    end
  end
end
