require 'faker'
require 'csv'

# Add your header here
header = %w(N_FNAME	N_LNAME	M_ADDR	M_CITY	M_STATE	M_ZIP5	TS_AGE	TS_GENDER_CODE
            TS_ETHNICITY	PERSON_TYPE	EMAIL_ADDRESS	PHONE_NUMBER)

@data_path = File.dirname(__FILE__) + "/data/data.csv"
CSV.open(@data_path, "wb") do |csv|
  csv << header

  # Use the Faker gem to create the fake data you need for each column.
  # Documentation: http://www.rubydoc.info/gems/faker/1.7.2
  10.times do
    csv << [Faker::Name.first_name.upcase, Faker::Name.last_name.upcase,
            Faker::Address.street_address, Faker::Address.city,
            Faker::Address.state_abbr, Faker::Address.zip_code,
            Faker::Number.between(20, 89), %w(M F).sample,
            %w(W B H I A).sample, 'prospect', '', '']
  end
end
