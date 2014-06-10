class Group < ActiveRecord::Base
  belongs_to :route

  validates :start_time, inclusion: 0...24.hours
end
