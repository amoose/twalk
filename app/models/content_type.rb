class ContentType < ActiveRecord::Base
	has_many :contents

  def self.default
    ContentType.first
  end
end
