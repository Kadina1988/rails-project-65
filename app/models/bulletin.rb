class Bulletin < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }

  belongs_to :user
  belongs_to :category

  scope :first_new, -> { order(created_at: :desc) }
end
