module FlickrHelper

	def flickrurl_1024 (info)
		#info = flickr.photos.getInfo(:photo_id => id)
		FlickRaw.url_b(info)
	end

	def flickrurl_240 (id)
		info = flickr.photos.getInfo(:photo_id => id)
		FlickRaw.url_m(info)
	end

	def photos_flickr_params (id)
		photos = flickr_photos(id)
	    photo_collection = Array.new
	    photos["photo"].each {|photo| photo_collection << [:url => flickrurl_1024(photo)]}
	    photo_collection
	end

	def not_imported_sets
		flickr_sets.reject{|element| @photosets.any?{|item| item.flickr_set_id == element['id']}}
	# flickr_sets.reject{|element| @photosets.any?{:flickr_set_id => element['id'])}
	end

	def flickr_sets
		flickraw_response = flickr.photosets.getList(:user_id => '26368973@N00')
		flickraw_response.to_a()
	end

	def flickr_photos (id)
		flickraw_response = flickr.photosets.getPhotos(:photoset_id => id,
													   :extras => 'tags',
													   :privacy_filter => '13')
		flickraw_response.to_hash()
	end
end

# flickr.photosets.getPhotos(:photoset_id => 72157626646672290, :extras => 'tags', :privacy_filter => '3')