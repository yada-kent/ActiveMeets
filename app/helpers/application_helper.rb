module ApplicationHelper
  def resize_image(image, width:, height:)
    return unless image.attached?

    image.variant(resize_to_limit: [width, height]).processed
  end
end
