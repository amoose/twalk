class User < ActiveRecord::Base
  rolify
  
  validates_presence_of :name, :nickname

  has_many :presentations

  extend FriendlyId
  friendly_id :nickname, use: :slugged

  validates_format_of :email, :with => /@/, :allow_blank => true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.name = auth[:info][:name] || ""
        user.nickname = auth[:info][:nickname] || ""
        user.location = auth[:info][:location] || ""
        user.image = auth[:info][:image] || ""
        user.description = auth[:info][:description] || ""
      end
    end
  end
end
