# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  photoset_id :integer
#  image_url   :string(255)
#  content     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Post < ActiveRecord::Base

	validates :title,  :presence => true,
					   :length   => { :maximum => 50 }
	
	validates :content,  :presence => true

	validates :image_url,  :presence => true

	default_scope :order => 'created_at DESC'
	
end
