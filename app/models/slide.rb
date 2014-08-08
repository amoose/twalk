class Slide < ActiveRecord::Base
	extend FriendlyId
	belongs_to :presentation
	has_many :contents

	friendly_id :sort_order, :use => :scoped, :scope => :presentation

	validates_presence_of :sort_order

	def should_generate_new_friendly_id?
    sort_order_changed?
  end
end
