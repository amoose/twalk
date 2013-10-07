class User < ActiveRecord::Base
  rolify
  # attr_accessible :role_ids, :as => :admin
  # attr_accessible :provider, :uid, :name, :email
  validates_presence_of :name

  def to_param
    # nickname
    id
  end


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
        user.name = auth[:info][:name] || ""
        user.nickname = auth[:info][:nickname] || ""
        user.location = auth[:info][:location] || ""
        user.image = auth[:info][:image] || ""
        user.description = auth[:info][:description] || ""
      end
    end
  end

  # def self.find(id)
  #   if id.type_of? Integer
  #     # super.find(id)
  #     User.where(:id => id)
  #   else
  #     self.find_by_name(id)
  #   end
  # end

end
