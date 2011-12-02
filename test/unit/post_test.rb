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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
