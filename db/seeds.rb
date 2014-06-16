# This file should contain all the record creation needed to seed the
# database with its default values.  The data can then be loaded with
# rake db:seed (or created alongside the db with db:setup).

require 'open-uri'
require 'csv'

# Postcode data for Glasgow, courtesy Ordnance Survey.
# http://www.ordnancesurvey.co.uk/docs/licences/os-opendata-licence.pdf
@data_url = 'http://dashboard.glasgow.gov.uk/ckanstore/files/'\
            '2014-03-03T20%3A36%3A53.752Z/glasgow-postcodes-geocoded.csv'

Location.delete_all

open(@data_url) do |io|
  # Create a new location record from every postcode record in
  # production, or every 500th elsewhere.
  records = CSV.new(io, headers: true, header_converters: :symbol)
            .each_slice(Rails.env.production? ? 1 : 500)
            .map(&:first)

  records.each do |r|
    Location.create!(postcode: r[:label], lat: r[:lat], long: r[:long])
  end

  puts "#{records.count} location records created"
end
