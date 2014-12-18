class Mercury::Image < ActiveRecord::Base

  self.table_name = :mercury_images
  
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => { 
        :access_key_id => ENV['ACCESS_KEY_ID'],
        :secret_access_key => ENV['SECRET_ACCESS_KEY']
      },
    :bucket => ENV['S3_BUCKET'],
    :url => ":s3_domain_url",
    :path => "/:attachment/images/:id_:basename.:style.:extension",
    :styles => { :medium => "1024x768>", :thumb => "512x512>" }


  

  delegate :url, :to => :image

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] ||= []
    options[:methods] << :url
    super(options)
  end

end
