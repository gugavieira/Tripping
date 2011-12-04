# == Schema Information
#
# Table name: photos
#
#  id              :integer         not null, primary key
#  photoset_id     :integer
#  url             :string(255)
#  private         :boolean         default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#  flickr_photo_id :integer
#

class Photo < ActiveRecord::Base
	belongs_to :photoset

	scope :only_public, where(:private => false)

end
