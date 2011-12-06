module FlickrHelper

	def flickrurl_1024 (info)
		#info = flickr.photos.getInfo(:photo_id => id)
		FlickRaw.url_b(info)
	end

	def flickrurl_240 (photo_id)
		info = flickr.photos.getInfo(:photo_id => photo_id)
		FlickRaw.url_m(info)
	end

	def photos_flickr_params (set_id)
		photos = flickr_photos(set_id)
		private_photos = flickr_photos(set_id, true)
	    photo_collection = Array.new
	    photos["photo"].each do |photo, index|
		    photo_collection << {"flickr_photo_id" => photo.id.to_i(),
			    				 "url" => flickrurl_1024(photo),
			    				 "private" => private_photos["photo"].any?{|item| item.id == photo.id},
			    				 "tags" => photo.tags}
		end
	    photo_collection
	end

	def not_imported_sets
		@photosets ||= Photoset.all
		flickr_sets.reject{|element| @photosets.any?{|item| item.flickr_set_id == element['id']}}
	end

	def flickr_set(set_id)
		flickraw_response = flickr.photosets.getInfo(:photoset_id => set_id)
	end

	def flickr_sets
		flickraw_response = flickr.photosets.getList(:user_id => '26368973@N00')
		flickraw_response.to_a()
	end

	def flickr_photos (set_id, restricted = false)
		if restricted
			filter = '3'
		else
			filter = '13'
		end
		flickraw_response = flickr.photosets.getPhotos(:photoset_id => set_id,
													   :extras => 'tags',
													   :privacy_filter => filter)
		# flickraw_response.to_hash()
	end

	def flickr_authenticate
			FlickRaw.api_key = "3b893b6dc999264844e09ea624784c74"
			FlickRaw.shared_secret = "f64f8a131db50a00"
			flickr.access_token = "72157628119605495-a0e68c4aee6782b8"
			flickr.access_secret = "e4fe28d854d1ced3"
			# flickr.get_access_token('72157628119605495-a0e68c4aee6782b8', 'e4fe28d854d1ced3', '386-750-440')
	end


end

# flickr.photosets.getPhotos(:photoset_id => 72157626646672290, :extras => 'tags', :privacy_filter => '3')