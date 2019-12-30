class CreateCollection < ActiveRecord::Migration[5.0]

  def change

    create_table :collections do |t|
      
      t.string :name
      t.integer :game_id
      t.integer :user_id 
    end 
  end

end
