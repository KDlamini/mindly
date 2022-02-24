module UsersHelper
  def user_avatar(url)
    if url.present?
      image_tag(url, alt: 'rss feed', class: 'thumbnail cell medium-6 large-2')
    else
      image_tag('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png',
                alt: 'rss feed', class: 'thumbnail cell medium-6 large-2')
    end
  end
end
