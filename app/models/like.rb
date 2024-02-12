class Like < ApplicationRecord
  belongs_to :travel
  belongs_to :user
  validates_uniqueness_of :travel_id, scope: :user_id
end
