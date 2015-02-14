class User < ActiveRecord::Base
	has_many :record
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :name, :presence => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :confirmation => true
#Only on Create so other actions like update password attribute can be nil
	#validates_length_of :password, :in => 6..20, :on => :create
end
