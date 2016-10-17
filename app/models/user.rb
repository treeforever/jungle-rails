class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false

  def self.authenticate_with_credentials(email, password)
    email = email.gsub(/\s+/, "")
    email = email.downcase
    user = User.find_by("lower(email) = ?", email)

    if user
      user.authenticate(password)
    else
      false
    end
  end

end
