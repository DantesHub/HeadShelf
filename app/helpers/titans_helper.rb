module TitansHelper
  def image_generator(height:, width:)
    "https://placehold.it/#{height}x#{height}"
  end

  def titan_img(_img, _type)
    if !_img.nil?
      _img
    elsif _type == 'thumb'
      image_generator(height: '350', width: '200')
    elsif image_generator(height: '600', width: '400')
    end
  end
end
