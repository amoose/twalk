class User < ActiveRecord::Base
  rolify
  after_create :set_default_role

  validates_presence_of :name, :nickname
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

  has_many :presentations
  has_many :party_members
  has_one :party

  extend FriendlyId
  friendly_id :nickname, use: :slugged

  validates_format_of :email, :with => /@/, :allow_blank => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth[:info][:name] || ""
        user.nickname = auth[:info][:nickname] || ""
        user.location = auth[:info][:location] || ""
        user.image = auth[:info][:image].gsub('http:','https:') || ""
        user.description = auth[:info][:description] || ""
      end
    end
  end

  def set_default_role
    add_role :user
  end
end
