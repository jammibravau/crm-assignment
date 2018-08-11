require_relative 'contact.rb'

class CRM

  def initialize
  end

  def main_menu
    while true
      print_main_menu
      choice = gets.chomp.to_i
      break if choice == 6
      call_option(choice)
    end
  end

  def print_main_menu
    puts "1. Add Contact"
    puts "2. Modify Contact"
    puts "3. Delete Contact"
    puts "4. Display All Contacts"
    puts "5. Search Contact"
    puts "6. End Program"
  end

  def call_option(choice)
    case choice
      when 1
        add_new_contacts
      when 2
        modify_existing_contact
      when 3
        delete_contact
      when 4
        display_all_contacts
      when 5
        search_by_attribute
      when 6
        return
      else
        puts "option not found"
    end
  end

  def add_new_contacts
    first_name = gets.chomp.to_s
    last_name = gets.chomp.to_s
    Contact.create(first_name, last_name)
  end

  def modify_existing_contact
    puts "what is the ID of the contact you would like to update?"
      id = gets.chomp.to_i
    puts "what attribute would you like to change?"
      attribute = gets.chomp.to_s
    puts "what would you like the new value to be?"
      new_value = gets.chomp.to_s
    Contact.update(id, attribute, new_value)
  end

  def delete_contact
    puts "What is the ID of the contact you would like to delete?"
    id = gets.chomp.to_i
    Contact.delete(id)
  end

  def display_all_contacts
  puts "#{Contact.all}"
  end

  def search_by_attribute
    puts "What attribute would you like to search by?"
    attribute = gets.chomp.to_s
    puts "please insert the value of #{attribute} to search for"
    value = gets.chomp.to_s
    Contact.find_by(attribute, value)
  end


end
