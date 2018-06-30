module UsersHelper

  def gravatar_for(user, options = { size: 80 })
  	# printf("em gravatar_for user.image: %s\n", user.image)
  	# printf("em gravatar_for user.image? %s\n", user.image?)
  	# printf("em gravatar_for user.image.file.nil? %s\n:", user.image.file.nil?) 
  	if user.image?
	    image_tag(user.image.small_thumb.url, alt: 'Image')
	else
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    size = options[:size]
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	    image_tag(gravatar_url, alt: user.name, class: "gravatar")
	    # printf("\n%s sem imagem em gravatar_for \n", user.name)
	end

  end

end
