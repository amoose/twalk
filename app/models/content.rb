class Content < ActiveRecord::Base
	extend FriendlyId

	belongs_to :slide
	belongs_to :content_type
	belongs_to :presentation

	friendly_id :sort_order, :use => :scoped, :scope => :slide

	validates_presence_of :content_type_id, :sort_order

	def should_generate_new_friendly_id?
    sort_order_changed?
  end

  def safe_body
    body.html_safe if body
  end
end
