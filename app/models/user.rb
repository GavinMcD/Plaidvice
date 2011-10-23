class User < ActiveRecord::Base
  
  # the create! do block gives us access to the user object before it
  # is saved - we ingest this info from the OmniAuth Twitter env var
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
