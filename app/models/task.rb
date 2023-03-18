class Task < ApplicationRecord
  validates :note, presence: true

  scope :not_completed, -> { where(completed_at: nil) }
end