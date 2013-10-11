class Theme < ActiveRecord::Base
	acts_as_taggable
	# belongs_to :slide
	has_many :slides
end
