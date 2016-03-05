class Slide < ActiveRecord::Base
  extend FriendlyId
  belongs_to :presentation
  belongs_to :theme
  has_many :contents, dependent: :destroy
  after_destroy :fix_sort_order
  friendly_id :sort_order, :use => [:history, :scoped], :scope => :presentation

  validates_presence_of :sort_order

  accepts_nested_attributes_for :contents

  def should_generate_new_friendly_id?
    sort_order_changed?
  end

  def fix_sort_order
    presentation = self.presentation
    i = 1
    presentation.slides.each do |slide|
      slide.update_attributes(sort_order: i) if slide.sort_order != i
      i = i+1
    end
  end
end
