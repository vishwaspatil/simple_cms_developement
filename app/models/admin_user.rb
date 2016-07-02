class AdminUser < ActiveRecord::Base

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ 
	
	# /\[A-Z0-9._%+-]+@[a-z0-9.-]+\[a-z]{2,4}\Z/i

	# validates_presence_of :first_name
	# validates_length_of :first_name, :maximum => 255
	# validates_presence_of :last_name
	# validates_length_of :last_name, :maximum => 255
	# validates_presence_of :username
	# validates_length_of :username, :within => 8..25
	# validates_uniqueness_of :username
	# validates_presence_of :Email
	# validates_length_of :Email, :maximum => 100
	# validates_format_of :Email, :with => EMAIL_REGEX
	# validates_confirmation_of :Email

	validates :first_name , :presence => true , :length => {:maximum => 25}			

	validates :last_name , :presence => true , :length => {:maximum => 50}	

	validates :username , :presence => true , :length => {:within => 8..25} , :key => "value", uniqueness => true	

	validates :email , :presence => true , :length => {:maximum => 25} , :format => EMAIL_REGEX , :confirmation => true


end
