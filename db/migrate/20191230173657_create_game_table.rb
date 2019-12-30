class CreateGameTable < ActiveRecord::Migration[5.0]
  def change
    
    create_table :games do |t|

      t.string :name 
      t.integer :max_players
      t.integer :min_players
      t.integer :min_playtime
      t.integer :max_playtime
      t.float :price
      t.integer :reddit_mentions
    end 
  end
end
