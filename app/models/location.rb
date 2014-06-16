class Location < ActiveRecord::Base
  # See https://en.wikipedia.org/wiki/Postcodes_in_the_United_Kingdom#Validation
  validates :postcode,
            format: /\A[A-Z]{1,2}\d[A-Z\d]? \d[A-Z]{2}\z/,
            uniqueness: true
  validates :lat,
            numericality: { greater_than_or_equal_to: -90,
                            less_than_or_equal_to: 90 }
  validates :long,
            numericality: { greater_than_or_equal_to: -180,
                            less_than_or_equal_to: 180 }

  before_validation do
    self.postcode = postcode.strip.upcase if postcode.respond_to? :strip
  end
end
