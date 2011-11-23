module AdminHelper

  def not_imported_sets
  	flickr_sets.reject{|element| Photoset.exists?(:flickr_set_id => element['id'])}
  end

  private

  def flickr_sets
  	flickraw_response = flickr.photosets.getList(:user_id => '26368973@N00')
	flickraw_response.to_a()
  end
end