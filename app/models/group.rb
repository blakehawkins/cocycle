class Group < ActiveRecord::Base
  attr_writer :time

  validates :hour,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than: 24 }
  validates :minute,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than: 60 }

  def time
    format '%02d:%02d', hour || 0, minute || 0
  end

  def time=(input)
    self.hour, self.minute = input.to_s.scan(/\d+/)
  end
end
