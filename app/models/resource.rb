# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  file_id    :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  event_id   :integer
#  mime_type  :string(255)
#  size       :integer
#

class Resource < ActiveRecord::Base
  belongs_to :event
end
