class AddGameRefToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :game, null: false, foreign_key: true
  end
end
