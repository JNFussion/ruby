require 'csv'
# Read the whole file and display it 

contents = File.read "event_attendees.csv"
#puts contents

#Read each line of the file and display 1 columns.
puts "\n"
lines = File.readlines "event_attendees.csv"
lines.each_with_index do |line, index|
    next if index == 0
    columns = line.split(",")
    name  =columns[2]
    puts name
end

# Use CSV library
puts "\n"
contents = CSV.open "event_attendees.csv", headers: true
contents.each do |row|
    name = row[2]
    puts name
end

# Use CSV library, convert headers name to symbols
puts "\n"
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
    name = row[:first_name]
    puts name
end