module TitansHelper
  def image_generator(height:, width:)
    "https://placehold.it/#{width}x#{height}"
  end

  def titan_img(img, type)
    if img.model.thumb_image? || img.model.main_image?
      img
    elsif type == 'thumb'
      image_generator(height: '325', width: '325')
    elsif type == 'main'
      image_generator(height: '400', width: '600')
    end
  end
end
