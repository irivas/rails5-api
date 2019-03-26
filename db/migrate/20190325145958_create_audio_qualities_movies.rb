class CreateAudioQualitiesMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_qualities_movies do |t|
      t.references :audio_quality
      t.references :movie

      t.timestamps
    end
    add_index :audio_qualities_movies, [:audio_quality_id, :movie_id], unique: true
  end
end
