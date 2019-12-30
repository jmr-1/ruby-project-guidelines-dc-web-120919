class RemoveMentionsGame < ActiveRecord::Migration[5.0]
  def change

    remove_column :games, :reddit_mentions
  end
end
