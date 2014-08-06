class ChangeColumnType < ActiveRecord::Migration
  def change
  	change_column :posts, :longitude, :float
  	change_column :posts, :latitude, :float
  end
end
