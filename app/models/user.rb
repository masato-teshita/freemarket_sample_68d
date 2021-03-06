class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise   :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  has_one  :address,                                                     dependent: :destroy
  has_one  :card,                                                        dependent: :destroy
  has_one  :account,                                                     dependent: :destroy
  has_one  :sales_price,                                                 dependent: :destroy
  has_one  :point,                                                       dependent: :destroy
  has_many :likes,                                                       dependent: :destroy
  has_many :from_messages,class_name: "Message" ,foreign_key: "from_id", dependent: :destroy
  has_many :evaluations
  
  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday
  end

  validates :last_name,      :first_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :password,                         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}/}

  def already_liked?(item)
    self.likes.exists?(item_id: item.id)
  end
  
  has_many :active_notifications,   class_name: "Notification",  foreign_key: "sender_id",   dependent: :destroy
  has_many :passive_notifications,  class_name: "Notification",  foreign_key: "receiver_id", dependent: :destroy
end
