class CollectionFavoriteAdded < ActiveRecord::Migration[5.0]
  def change

    add_column :collections, :favorite, :boolean 
  end
end
