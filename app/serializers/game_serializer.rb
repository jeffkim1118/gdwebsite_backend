class GameSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :genre, :release_date, :developer, :price, :created_at, :updated_at, :reviews
end
