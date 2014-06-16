class Group < ActiveRecord::Base
  validates :time, format: /\A([01]\d|2[0-3]):([0-5]\d)\Z/
end
