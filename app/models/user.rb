class User < ActiveRecord::Base  
  # Relationships
  # -----------------------------------
  has_many :nuggets, :dependent => :destroy
  
  # new columns need to be added here to be writable through mass assignment
  # whenever you create or update a model in your controllers by using mass assignment
  attr_accessible :image, :description, :name
  
  
  # the create! do block gives us access to the user object before it
  # is saved - we ingest this info from the OmniAuth Twitter request.env
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.description = auth["user_info"]["description"]
      user.image = auth["user_info"]["image"]
      user.nickname = auth["user_info"]["nickname"]
    end
  end
  
  searchable do
    text  :name, :nickname, :image, :description
  end
  
end
