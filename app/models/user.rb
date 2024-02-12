class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      mount_uploader :image, ImageUploader
  has_many :travels, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_travels, through: :likes, source: :travel
  has_many :comments, dependent: :destroy
  def already_liked?(travel)
    self.likes.exists?(travel_id: travel.id)
  end
  validates :name, presence: true #追記
  validates :profile, length: { maximum: 200 }
end
