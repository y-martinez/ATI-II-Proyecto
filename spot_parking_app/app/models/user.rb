class User < ActiveRecord::Base
	has_many :record
	validates :email, uniqueness: true
end
