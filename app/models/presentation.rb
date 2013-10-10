class Presentation < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :slides, :dependent => :destroy

  acts_as_taggable
end
