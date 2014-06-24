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
  puts "Downloading postcode data from #{@data_url}"

  # Create a new location record from every postcode record in
  # the range 'G1 ???'..'G19 ???'.
  records = CSV.new(io, headers: true, header_converters: :symbol)
            .select { |record| record[:label] =~ /\AG1?\d / }

  # Take a subset of the records when seeding the development database.
  records = records.each_slice(50).map(&:first) unless Rails.env.production?

  puts "Creating #{records.count} location records (this will take a while)..."

  records.each do |r|
    Location.create!(postcode: r[:label], lat: r[:lat], long: r[:long])
  end

  puts "#{Location.count} location records created"
end
