class CreateAsignationUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :asignation_user_groups do |t|
      t.references :user, foreign_key: true
      t.references :social_group, foreign_key: true

      t.timestamps
    end
  end
end
