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
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => { 
        :access_key_id => ENV['ACCESS_KEY_ID'],
        :secret_access_key => ENV['SECRET_ACCESS_KEY']
      },
    :bucket => ENV['S3_BUCKET'],
    :url => ":s3_domain_url",
    :path => "/:class/images/:id_:basename.:style.:extension",
    :styles => { :medium => "1024x768>", :thumb => "512x512>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

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

  def safe_description
    description.try(:html_safe)
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
