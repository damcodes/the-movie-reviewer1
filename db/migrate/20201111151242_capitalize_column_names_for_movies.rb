class CapitalizeColumnNamesForMovies < ActiveRecord::Migration[6.0]
  def change
    change_table :movies do |t|
      t.rename :title, :Title
      t.rename :year, :Year
      t.rename :rated, :Rated 
      t.rename :released, :Released 
      t.rename :runtime, :Runtime 
      t.rename :genre, :Genre 
      t.rename :director, :Director 
      t.rename :actors, :Actors 
      t.rename :plot, :plot
      t.rename :poster, :Poster 
      t.rename :production, :Production
    end
  end
end
