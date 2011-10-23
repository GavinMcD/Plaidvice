class User < ActiveRecord::Base  
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
    end
  end
  
end
