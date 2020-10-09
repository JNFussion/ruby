require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'date'
require 'pp'

def clean_zipcode(zipcode)
  if zipcode.nil?
    zipcode = '00000'
  elsif zipcode.length > 5
    zipcode = zipcode.slice(0, 5)

  #    until zipcode.length == 5
  #         zipcode.char.pop
  #    end

  elsif zipcode.length < 5

    zipcode = zipcode.rjust(5, '0')

  # until zipcode.length == 5
  #     zipcode = '0' + zipcode
  # end

  else
    zipcode
  end
end

# It does the same as clean_zipcode. rjust dont work when length is > 5 and slice dont work when length is >= 5
def improved_clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone_numbers(phone_number)
  phone_number = phone_number.split(/[^0-9]/).delete_if { |value| value.match(/[^0-9]/) || value.empty? }.join

  if phone_number.length < 10
    '0' * 10
  elsif phone_number.length == 10
    phone_number
  elsif phone_number.length == 11
    if phone_number[0] == '1'
      phone_number[1..phone_number.length]
    else
      '0' * 10
    end
  else
    '0' * 10
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(address: zip, levels: 'country', roles: %w[legislatorUpperBody legislatorLowerBody])
  rescue StandardError
    'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
  end
end

def count_hours(arr)
  arr.each_with_object(Hash.new(0)) do |date, result|
    result[{ hour: date.hour }] += 1
  end
end

def count_days(arr)
  arr.each_with_object(Hash.new(0)) do |date, result|
    result[{ week_day: date.wday, weak_day_name: date.strftime('%A') }] += 1
  end
end

def save_thank_you_letter(id, form_letter)
  Dir.mkdir('output') unless Dir.exist? 'output'
  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|
    file.puts form_letter
  end
end

puts 'EventManager Initialized'

# Displaying the Zip codes and fixing the wrong ones
puts "\n"
contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
# contents.each do |row|
#     name = row[:first_name]
#     zipcode = clean_zipcode(row[:zipcode])
#     puts "#{name} #{zipcode}"
# end

# Showing all legislators in a zip code using google's api Civic
puts "\n"

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
# contents.each do |row|
#     name = row[:first_name]
#     zipcode = improved_clean_zipcode(row[:zipcode])
#     legislators = legislators_by_zipcode(zipcode)

#     puts "#{name} #{zipcode} #{legislators}"
# end

# Read a template letter and personalize it for each person

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read 'form_letter.html'

# contents.each do |row|
#     name = row[:first_name]
#     zipcode = improved_clean_zipcode(row[:zipcode])
#     legislators = legislators_by_zipcode(zipcode)

#     personal_letter = template_letter.gsub('FIRST_NAME', name)
#     personal_letter.gsub!('LEGISLATORS', legislators)

#     puts personal_letter
# end

# Using ERB as template.

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter

# contents.each do |row|
#     name = row[:first_name]
#     zipcode = improved_clean_zipcode(row[:zipcode])
#     legislators = legislators_by_zipcode(zipcode)
#     form_letter = erb_template.result(binding)
#     puts form_letter
# end

# save the modify template in a file giving a unique filename

# contents.each do |row|
#     id = row[0]
#     name = row[:first_name]
#     zipcode = clean_zipcode(row[:zipcode])
#     legislators = legislators_by_zipcode(zipcode)
#     form_letter = erb_template.result(binding)

#     save_thank_you_letter(id,form_letter)

# end

# display attendeces and phone number

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
# contents.each do |row|
#     name = row[:first_name]
#     phone = clean_phone_numbers(row[5])

#     puts "#{name} -> #{phone}"
# end

date_format = '%m-%d-%y %H:%M'
dates = []
contents.each do |row|
  dates << DateTime.strptime(row[1].gsub(/[^0-9]/, ' '), '%m %d %y %H %M')
end

hours = count_hours(dates)
days = count_days(dates)
max_hours = hours.max_by { |_k, v| v }
max_days = days.max_by { |_k, v| v}
puts 'Hour with more registrations'
pp max_hours

puts 'Day of the week with more registrations'
pp max_days
