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
#

require 'test_helper'

class PhotosetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
