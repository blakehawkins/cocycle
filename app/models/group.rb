class Group < ActiveRecord::Base
  belongs_to :location

  validates :time, format: /\A([01]\d|2[0-3]):([0-5]\d)\Z/

  before_validation :convert_12_hour_time, :convert_digit_time

  private

  def convert_12_hour_time
    time.match(/\A
      (?<h>1[0-2]?|0?[1-9]) # hour: 1, 10-12, 2-9, 01-09
      (?<m>:[0-5]\d)?       # min: optional :00-:59
      \ ?                   # optional space
      (?:[aA]|(?<p>[pP]))   # afternoon?
      [mM]?                 # optional meridian suffix
    \z/x) do |m|
      h = m[:h].to_i
      time.replace sprintf '%02d', (h < 12 ? h : 0) + (m[:p] ? 12 : 0)
      time << (m[:m] || ':00')
    end if time.respond_to?(:match)
  end

  def convert_digit_time
    case time.length
    when 1 then time.prepend('0') << ':00'
    when 2 then time << ':00'
    when 4 then time.insert 2, ':'
    end if time.respond_to?(:match) && time.match(/\A\d+\z/)
  end
end
