class Task < ApplicationRecord
  validates :title, presence: true

  # validates :effort_level, inclusion: [1, 2, 3]

  scope :in_progress, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end