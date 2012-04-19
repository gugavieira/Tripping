# == Schema Information
#
# Table name: photosets
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  flickr_set_id    :integer
#  created_at       :datetime
#  updated_at       :datetime
#  flickr_thumb_url :string(255)
#  position         :integer
#

class Photoset < ActiveRecord::Base
	has_many :photo, :dependent => :destroy
	
	default_scope :order => 'position'

	def to_param
		"#{id} #{name}".parameterize
	end

	def self.refresh_order
		self.all.each_with_index do |photoset, index|
			photoset.update_attributes(:position => index + 1)
		end
	end
	
end
