class CreateGenresMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :genres_movies do |t|
      t.references :movie
      t.references :genre

      t.timestamps
    end
    add_index :genres_movies, [:genre_id, :movie_id], unique: true
  end
end
