class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :movie
      t.string :title
      t.string :director
      t.integer :runtime_in_minutes
      t.text :description
      t.string :poster_image_url
      t.datetime :release_date
    end
  end
end
