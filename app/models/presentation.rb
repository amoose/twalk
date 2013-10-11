class Presentation < ActiveRecord::Base
	extend FriendlyId

  has_many :slides, :dependent => :destroy
  has_many :contents, :dependent => :destroy, through: :slides

  belongs_to :user
  friendly_id :name, :use => :slugged

  acts_as_taggable

  def should_generate_new_friendly_id?
    name_changed?
  end
end
