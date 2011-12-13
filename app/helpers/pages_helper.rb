module PagesHelper 
	def image_to_base64(url)
		 ActiveSupport::Base64.encode64(open(url).to_a.join)
	end
end