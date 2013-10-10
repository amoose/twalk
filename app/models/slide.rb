class Slide < ActiveRecord::Base
	belongs_to :presentation
	has_one :theme
	has_many :contents
end
