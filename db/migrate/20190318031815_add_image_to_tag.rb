class AddImageToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :image, :string
  end
end
