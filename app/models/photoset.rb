# == Schema Information
#
# Table name: photosets
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  flickr_set_id    :string(255)
#  flickr_thumb_url :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Photoset < ActiveRecord::Base
end
