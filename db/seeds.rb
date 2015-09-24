# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
city = %w(Austin Dallas Houston Atlanta)
course = %w(Frontend Backend Design)

30.times do
  location = Location.create({
    city: city.sample,
    state: Faker::Address.state_abbr
    })
  cohort = Cohort.create({
    name: course.sample,
    location_id: location.id
    })
  Student.create({
    cohort_id: cohort.id
    name: Faker::Name.name
    })
end
