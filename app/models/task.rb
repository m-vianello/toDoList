class Task < ApplicationRecord
  validates :title, presence: true

  scope :in_progress, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end