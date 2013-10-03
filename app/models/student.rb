require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, :format => { :with => /.+@.+[.].{2,}/, :message => "Please enter valid email" }
  validates :email, :uniqueness => true
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }


  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    ((Date.today - self.birthday).to_i / 365)
  end
end



# Email addresses must contain at least one @ character and one . character, with at least one character before the @, one character between the @ and first ., and at least two characters after the final ..