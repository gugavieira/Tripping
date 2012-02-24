module TumblrHelper
	def recent_tumblr
		Tumblr.blog = 'iamtripping'
		Tumblr::Post.first(:query => {:tagged => 'featured', :type => 'photo'})
	end
end