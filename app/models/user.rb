class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]
  validates :username, presence: true, uniqueness: true, length: {maximum: 15}, format: { without: /\s/ }
  validates :name, presence: true
  validates :birthdate, presence: true
  validates :genre, presence: true
  
  

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  enum role: [:guest, :author, :moderator]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
end
