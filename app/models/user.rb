class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  has_one :card, dependent: :destroy
  has_many :comments

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :family_name, :first_name, with: NAME_REGEX, presence: true,
                                                 message: 'は全角で入力してください'

  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :family_name_kana, :first_name_kana, with: NAME_KANA_REGEX, presence: true,
                                                           message: 'は全角カタカナで入力して下さい'

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
