class PartyMember < ActiveRecord::Base
	belongs_to :party
	belongs_to :user
	has_one :presentation, :through => :party
end
