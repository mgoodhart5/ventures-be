class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
             :email,
             :image_url,
             :bio
end
