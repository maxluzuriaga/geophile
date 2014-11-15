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

class Post < ActiveRecord::Base
  belongs_to :event
end
