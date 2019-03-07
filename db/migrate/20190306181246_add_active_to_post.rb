class AddActiveToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :active, :boolean, default: false
  end
end
