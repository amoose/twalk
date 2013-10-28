class Party < ActiveRecord::Base
	belongs_to :user
	belongs_to :presentation
	has_many :party_members
	
end
