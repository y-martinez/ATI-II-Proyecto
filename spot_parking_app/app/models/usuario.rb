class Usuario < ActiveRecord::Base
<<<<<<< HEAD
	has_many: historial
end
=======

  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..20, :on => :create



  def self.authenticate(name_or_email="", login_password="")

    if  EMAIL_REGEX.match(name_or_email)    
      user = Usuario.find_by_email(name_or_email)
    else
      user = Usuario.find_by_name(name_or_email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end



  def encrypt_password
    unless password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
  end

end
>>>>>>> 43e7ebe7a058460c17451e5d7752c7c30c0c1581
