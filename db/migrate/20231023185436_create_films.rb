class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :release_year
      t.string :synopsis
      t.string :country
      t.integer :duration

      t.timestamps
    end
  end
end
