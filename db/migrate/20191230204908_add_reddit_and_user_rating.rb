class AddRedditAndUserRating < ActiveRecord::Migration[5.0]
  def change

    add_column :games, :reddit_all_time_count, :integer
    add_column :games, :average_user_rating, :integer
    add_column :games, :year_published, :integer 
  end
end
