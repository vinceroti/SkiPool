class User < ActiveRecord::Base

  before_save :cap_first_name, :cap_last_name, :cap_location

  validates :first_name, :last_name, :location, :email, :encrypted_password, presence: true
  validates :first_name, :last_name, length: { minimum: 1 }
  validates :encrypted_password, length: { minimum: 6 }
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def cap_first_name
    self.first_name = self.first_name.capitalize
  end

  def cap_last_name
    self.last_name = self.last_name.capitalize
  end

  def cap_location
    self.location = self.location.capitalize
  end


  def authenticate(password)
		self.password == password
  end

  def password
  	@password ||= BCrypt::Password.new(encrypted_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.encrypted_password = @password
  end
end