class User < ActiveRecord::Base
	has_secure_password

	validates :email, presence: true, uniqueness: true
	#user.authentication("password")
	#nambahin 2, password dan password_confirmation
	#nambahin validasi password dan password_confirmation

end
