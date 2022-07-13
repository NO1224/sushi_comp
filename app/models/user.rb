class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  # 〜省略〜

  validates :password, format: { allow_blank: true,
    with: VALID_PASSWORD_REGEX,
    message: 'include both letters and numbers'}
  validates :nickname, presence: true, length: { maximum: 20 }
end
