class ReviewSerializer
  include JSONAPI::Serializer
  attributes :id, :rating, :comment, :game_id, :user_id, :created_at, :updated_at
end
