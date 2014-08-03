class Theme < ActiveRecord::Base
	acts_as_taggable
	has_many :presentations
end
