module UsersHelper

  def gravatar_for(user, options = { size: 80 })
  	printf("user.image em gravatar_for: %s\n", user.image)
  	if user.image.file.nil? 
  		printf("não nill") 
  	end
  	if user.image?
	    # image_tag(user.image.url, alt: 'Image')
	    # link_to(image_tag(@user.image.thumb.url, alt: 'Image'), @user.image.url, target: '_blank')
	    image_tag(@user.image.thumb.url, alt: 'Image')
	    # printf("\n%s com imagem em gravatar_for: %s \n", user.name, user.image)
	else
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    size = options[:size]
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	    image_tag(gravatar_url, alt: user.name, class: "gravatar")
	    printf("\n%s sem imagem \n", user.name)
	end

  end

end
