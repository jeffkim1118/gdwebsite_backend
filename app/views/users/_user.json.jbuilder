json.extract! user, :id, :username, :first_name, :last_name, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
