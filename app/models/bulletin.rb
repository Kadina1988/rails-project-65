# frozen_string_literal: true

class Bulletin < ApplicationRecord
  has_one_attached :image

  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
  validates :image, presence: true
  validates :image, attached: true, content_type: %i[png jpg jpeg],
                    size: { less_than: 5.megabytes, message: 'is too large' }

  belongs_to :user
  belongs_to :category

  scope :first_new, -> { order(created_at: :desc) }
end
