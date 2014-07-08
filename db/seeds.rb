# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Add global configuration options
NmsConfig.create(key: "Primary Group", value: nil)


# List of available media types
media_types = ["Photo", "XML"]
# Save available media types
media_types.each do |type|
  MediaTypes.create(type_name: type)
end