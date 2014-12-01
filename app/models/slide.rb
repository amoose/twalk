class Slide < ActiveRecord::Base
  extend FriendlyId
  belongs_to :presentation
  belongs_to :theme
  has_many :contents

  friendly_id :sort_order, :use => [:history, :scoped], :scope => :presentation

  validates_presence_of :sort_order

  accepts_nested_attributes_for :contents

  def should_generate_new_friendly_id?
    sort_order_changed?
  end
end
