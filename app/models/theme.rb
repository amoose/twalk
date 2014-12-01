class Theme < ActiveRecord::Base
	acts_as_taggable
	has_many :presentations
  has_many :slides

  def self.default
    Theme.first
  end
end
