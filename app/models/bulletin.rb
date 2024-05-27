class Bulletin < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
  validates :image, presence: true
  validates :image, attached: true, content_type: 'image/png'
  # validate :image_validation

  belongs_to :user
  belongs_to :category

  scope :first_new, -> { order(created_at: :desc) }

  # def image_validation
  #   if image.attached?
  #     if image.blob.byte_size > 5242880
  #       image.purge
  #       errors[:base] >> 'Image too big'
  #     elsif !image.blob.content_type.starts_with?('image/')
  #       image.purge
  #       errors[:base] << 'Wrong format'
  #     end
  #   end
  # end
end
