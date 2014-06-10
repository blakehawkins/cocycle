class Route < ActiveRecord::Base
  validates :start_lat, :finish_lat, inclusion: -90..90
  validates :start_long, :finish_long, inclusion: -180..180
end
