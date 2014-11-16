# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :date
#  end_date   :date
#  user_id    :integer
#  latitude   :float
#  longitude  :float
#  radius     :integer
#  created_at :datetime
#  updated_at :datetime
#

EARTH_RADIUS = 20903520 # feet

def distance(lat1, lng1, lat2, lng2)
  dLat = to_radians(lat2 - lat1)
  dLng = to_radians(lng2 - lng1)

  a = Math.sin(dLat/2) * Math.sin(dLat/2) + 
      Math.cos(to_radians(lat1)) * Math.cos(to_radians(lat2)) *
      Math.sin(dLng/2) * Math.sin(dLng/2)
  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

  EARTH_RADIUS * c
end

def to_radians(d)
  d * Math::PI / 180
end

class Event < ActiveRecord::Base
  belongs_to :user
  has_many :posts, -> { order(:created_at => :desc) }
  has_many :resources, -> { order(:created_at => :desc) }

  def self.locate(lat, lng)
    possibles = Event.where("start_date <= ? AND end_date >= ?", Date.today, Date.today)

    possibles.select do |e|
      distance(e.latitude, e.longitude, lat, lng) <= e.radius
    end
  end
end
