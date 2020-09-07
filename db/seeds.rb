# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Running Seed File..."

def create_data
	require 'csv'

	table_data = CSV.parse(File.read("data.csv"), { headers: false, return_headers: false })
	table_data.shift
		table_data.each do |data|
			mapping = Mapping.find_or_create_by(name: data[9])
			role = Role.find_or_create_by(name: data[6])
			req = data[7] == "Yes" ? true : false
			question = Question.find_or_create_by(name: data[1], 
				teaming_stages: data[2],
				appears: data[3],
				frequency: data[4],
				required: req,
				conditions: data[8],
				role_id: role.id, mapping_id: mapping.id)
		end

		Question.update_all(question_type: "Rating scale")
end


create_data