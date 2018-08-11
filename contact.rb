class Contact

  attr_accessor :first_name, :lastname, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 0

  # This method should initialize the contact's attributes
  def initialize(id, first_name, last_name, options = {})
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @note = options[:note]
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, options = {})
    @@id += 1
    new_contact = self.new(@@id, first_name, last_name, options)
    @@contacts << new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def self.update(id, attribute, new_value)
    @@contacts.each do |contact|
      if contact.id == id
        case attribute
        when "first name"
          contact.first_name = new_value
          return contact.first_name
        when "last name"
          contact.last_name = new_value
          return contact.last_name
        when "email"
          contact.email = new_value
          return contact.email
        when "note"
          contact.note = new_value
          return contact.note
        end
      end
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@contacts.each do |contact|
      case attribute
      when "first name"
        if contact.first_name == value
          return contact
        end
      when "last name"
        if contact.last_name == value
          return contact
        end
      when "email"
        if contact.email == value
          return contact
        end
      when "note"
        if contact.note == value
          return contact
        end
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    return "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def self.delete(id)
    @@contacts.each do |contact|
      if contact.id == id
        @@contacts.delete(contact)
      end
    end
  end

  # Feel free to add other methods here, if you need them.
end
