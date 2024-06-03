# frozen_string_literal: true

class Bulletin < ApplicationRecord
  include AASM

  has_one_attached :image

  validates :category_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  # validates :image, presence: true
  # validates :image, attached: true, content_type: %i[png jpg jpeg],
  #                   size: { less_than: 5.megabytes, message: 'is too large' }

  belongs_to :user
  belongs_to :category

  scope :first_new, -> { order(created_at: :desc) }

  aasm do
    state :draft, initial: true
    state :under_moderation
    state :published
    state :rejected
    state :archived

    event :archive do
      transitions from: [:draft, :under_moderation, :published, :rejected], to: :archived
    end

    event :to_moderate do
      transitions from: :draft, to: :under_moderation
    end

    event :reject do
      transitions from: :under_moderation, to: :rejected
    end

    event :publish do
      transitions from: :under_moderation, to: :published
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    [
      "title", "aasm_state", "category_id", "created_at",
      "description", "id", "id_value", "updated_at", "user_id"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "image_attachment", "image_blob", "user"]
  end

end
