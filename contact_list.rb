require "pry"
require 'colorize'


@contacts = [{name: "Emmy", email: "emmy@fakemail.com", phone: "4158675309"},]

def view_contacts
  @contacts.each_with_index do |contact, i |
    puts "\nContact: #{i + 1}"
    puts "#{contact[:name]}"
    puts "#{contact[:email]}"
    puts "#{contact[:phone]}"
  end
end


def new_contact
  contact_hash = {}
  puts "Enter Contact Name:"
  name = gets.chomp
  name.length > 0 ? contact_hash[:name] = name : new_contact
  puts "\nEnter Contact Email"
  email = gets.strip
  contact_hash[:email] = email
  puts "\nEnter Contact Phone"
  phone = gets.strip
  contact_hash[:phone] = phone
  @contacts << contact_hash
  puts "Contact: #{name} added."

end


def delete_contact
  view_contacts
  puts "Enter the number of the contact you would like to delete: "
  number = gets.chomp.to_i
  @contacts.delete_at(number - 1)
  puts "Contact #{number} has been deleted."
end


def menu
  puts "~~Contacts List Menu~~"
  puts "1) View all Contacts"
  puts "2) Add a New Contact"
  puts "3) Delete A Contact"
  puts "4) Exit "
  puts "\n"
end

while true
  menu
  choice = gets.chomp.to_i

  case choice
    when 1
      view_contacts
    when 2
      new_contact
    when 3
      delete_contact
    when 4
      puts "Thank you for using the contact list."
      exit(0)
    else
      puts "That's not a valid option, please try again."
  end
end

menu
