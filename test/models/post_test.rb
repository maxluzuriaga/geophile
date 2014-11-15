# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
