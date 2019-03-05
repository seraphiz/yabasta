class CreateSocialGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :social_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
