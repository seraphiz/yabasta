class AsignationUserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :social_group
end
