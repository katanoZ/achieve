module ApplicationHelper
  def profile_img(user, size = "")

    if user.avatar?
      case size
      when "small"
        return image_tag(user.avatar, alt: user.name, size: "100x100", class: "img-circle")
      else
        return image_tag(user.avatar, alt: user.name)
      end
    end

    unless user.provider.blank?
      image_url = user.image_url
    else
      image_url = "no_image.png"
    end

    case size
    when "small"
      image_tag(image_url, alt: user.name, size: "100x100", class: "img-circle")
    else
      image_tag(image_url, alt: user.name)
    end
  end
end
