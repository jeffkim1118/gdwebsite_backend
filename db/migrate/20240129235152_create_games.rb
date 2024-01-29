class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.date :release_date
      t.string :developer
      t.decimal :price

      t.timestamps
    end
  end
end
