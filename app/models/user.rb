class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  validates :encrypted_password, format: { with: /[a-z\d]{6}/i}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :last_name_furigana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :first_name_furigana, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :birthday, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
