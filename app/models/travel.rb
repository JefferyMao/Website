class Travel < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :comment_users, through: :comments, source: :user
    mount_uploader :image, ImageUploader
end
