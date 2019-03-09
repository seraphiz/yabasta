class Post < ApplicationRecord
    # validate periodd_of_day ["Prefiero no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]
    belongs_to :user, optional: true 
    belongs_to :tag
    has_many :comments, dependent: :destroy

end
