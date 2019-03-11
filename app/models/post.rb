class Post < ApplicationRecord
    # validate periodd_of_day ["Prefiero no decirlo", "Mañana", "Tarde", "Noche", "Madrugada"]
    belongs_to :user, optional: true 
    belongs_to :tag
    has_many :comments, dependent: :destroy
    validates :date, presence: true
    validates :period_of_day, presence: true
    validates :content, presence: true
    validates :address, presence: true

    geocoded_by :address
    after_validation :geocode

end
