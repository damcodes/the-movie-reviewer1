class AddMovieAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :title, :string
    add_column :movies, :year, :string
    add_column :movies, :rated, :string
    add_column :movies, :released, :string
    add_column :movies, :runtime, :string
    add_column :movies, :genre, :string
    add_column :movies, :director, :string
    add_column :movies, :actors, :string
    add_column :movies, :plot, :text
    add_column :movies, :poster, :string
    add_column :movies, :imdbID, :string
    add_column :movies, :production, :string
  end
end
