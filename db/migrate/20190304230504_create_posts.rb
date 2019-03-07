class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.date :date
      t.string :period_of_day
      t.integer :age
      t.boolean :anonymous, default: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
