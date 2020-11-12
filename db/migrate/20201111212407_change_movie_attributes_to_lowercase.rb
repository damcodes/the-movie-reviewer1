class ChangeMovieAttributesToLowercase < ActiveRecord::Migration[6.0]
  def change
    change_table :movies do |t|
      t.rename :Title, :title
      t.rename :Year, :year
      t.rename :Rated, :rated 
      t.rename :Released, :released 
      t.rename :Runtime, :runtime 
      t.rename :Genre, :genre 
      t.rename :Director, :director 
      t.rename :Actors, :actors 
      t.rename :Plot, :plot
      t.rename :Poster, :poster 
      t.rename :Production, :production
    end
  end
end
