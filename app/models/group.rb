class Group < ActiveRecord::Base
  TIME_REGEXP = /\A
    (?<hour>[01]\d|2[0-3])      # hour 00..23
    :?                          # optional separator
    (?<minute>[0-5]\d)          # minute 00..59
  \Z/x

  belongs_to :route

  validates :start_time, inclusion: 0...24.hours

  def time=(str)
    self.start_time = nil unless TIME_REGEXP.match str do |match|
      self.start_time = match['hour'].to_i.hours + match['minute'].to_i.minutes
    end
  end

  def time
    Time.at(start_time).utc.to_s :time if start_time
  end
end
