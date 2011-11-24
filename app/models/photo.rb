# == Schema Information
#
# Table name: photos
#
#  id          :integer         not null, primary key
#  photoset_id :integer
#  url         :string(255)
#  private     :boolean         default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

class Photo < ActiveRecord::Base
	attr_accessible :url

	belongs_to :photoset
end
