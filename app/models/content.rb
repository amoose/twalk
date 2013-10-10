class Content < ActiveRecord::Base
	belongs_to :slide
	has_one :content_type
end
