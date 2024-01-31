class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :first_name, :last_name, :username ,:email, :password, :created_at, :updated_at
end
