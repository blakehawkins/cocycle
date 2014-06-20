class Group < ActiveRecord::Base
  belongs_to :location

  validates :time, format: /\A([01]\d|2[0-3]):([0-5]\d)\Z/

  before_validation do
    if time.respond_to?(:match) && time.match(/\A\d+\z/)
      case time.length
      when 1 then time.prepend('0') << ':00'
      when 2 then time << ':00'
      when 4 then time.insert 2, ':'
      end
    end
  end
end
