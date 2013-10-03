require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /.+@.+[.].{2,}/, :message => "Please enter valid email" }
  validates :email, :uniqueness => true
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validates :phone, :format => { :with => /\(?[0-9]{3}\)?[-. ]?[0-9]{3}[-. ]?[0-9]{4}/, :message => "Please enter a phone number with at least 10 digits."}

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    ((Date.today - self.birthday).to_i / 365)
  end
end



# Phone numbers must contain at least 10 digits, excluding non-numeric characters.