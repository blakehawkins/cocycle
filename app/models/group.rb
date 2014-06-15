class Group < ActiveRecord::Base
  validates :hour,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than: 24 }
  validates :minute,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than: 60 }

  def time
    format '%02d:%02d', hour || 0, minute || 0
  end

  def time=(input)
    _, h, m = */\A([01]\d|2[0-3]):([0-5]\d)\Z/.match(input.to_s)
    self.hour, self.minute = h, m
  end
end
