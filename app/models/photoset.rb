# == Schema Information
#
# Table name: photosets
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  flickr_set_id   :integer
#  flickr_thumb_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Photoset < ActiveRecord::Base
end
