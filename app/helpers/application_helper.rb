module ApplicationHelper

	def title
		base_title = "Tripping"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

	def flickrurl_240 (id)
		info = flickr.photos.getInfo(:photo_id => id)
		FlickRaw.url_m(info)
	end
end
