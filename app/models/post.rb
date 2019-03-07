class Post < ApplicationRecord
    # validate periodd_of_day ["Prefiero no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]
    belongs_to :user, dependent: :destroy, optional: true 
    belongs_to :tag, dependent: :destroy
    has_many :comments, dependent: :destroy
end
