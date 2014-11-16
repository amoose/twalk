class Presentation < ActiveRecord::Base
	extend FriendlyId

  has_many :slides, :dependent => :destroy
  has_many :contents, :dependent => :destroy, through: :slides
  has_many :parties, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :slug

  belongs_to :user
  belongs_to :theme
  friendly_id :name, :use => :slugged

  acts_as_taggable

  geocoded_by :ip_address

  def mine?(who)
    user_id == who.id
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  def ip_address
  	request.remote_ip
  end

  def has_party?
    self.parties.any?
  end
  
  def self.for(user_id)
    Presentation.where(:user_id => user_id)
  end
end
