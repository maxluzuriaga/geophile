# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  email         :string(255)
#  provider      :string(255)
#  uid           :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  token         :string(255)
#  refresh_token :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
