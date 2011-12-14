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
#  tags            :string(255)
#  position        :integer
#  thumb_url       :string(255)
#  height          :integer
#  width           :integer
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
