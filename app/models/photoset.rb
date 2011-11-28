# == Schema Information
#
# Table name: photosets
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  flickr_set_id    :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  flickr_thumb_url :string(255)
#

class Photoset < ActiveRecord::Base
	has_many :photo, :dependent => :destroy

	default_scope :order => 'updated_at DESC'
end