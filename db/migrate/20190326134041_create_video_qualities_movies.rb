class CreateVideoQualitiesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :video_qualities_movies do |t|
      t.references :video_quality
      t.references :movie

      t.timestamps
    end
    add_index :video_qualities_movies, [:video_quality_id, :movie_id], unique: true
  end
end
