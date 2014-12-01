class Presentation < ActiveRecord::Base
	extend FriendlyId
  resourcify
  
  has_many :slides, :dependent => :destroy
  has_many :contents, :dependent => :destroy, through: :slides
  has_many :parties, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :slug

  belongs_to :user
  belongs_to :theme
  friendly_id :slug_candidates, :use => [:history, :scoped], :scope => :user
  
  acts_as_taggable

  geocoded_by :ip_address

  accepts_nested_attributes_for :slides, :theme

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

  def short_description
    description.to_s.split.first(10).join(' ')
  end
  
  def self.for(user_id)
    Presentation.where(:user_id => user_id)
  end

  def slug_candidates
    [
      :name,
      [:name, :short_description],
      [:name, :short_description, Time.now.strftime('%y%m%d')],
      [:name, :short_description, Time.now.strftime('%y%m%d-%H%M')]
    ]
  end
end
