class AddContentAndMovieIdAndUserIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :content, :text
    add_column :reviews, :user_id, :integer
    add_column :reviews, :movie_id, :integer
  end
end
