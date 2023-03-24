class Task < ApplicationRecord
  EFFORT_LEVELS = [1, 2, 3].freeze

  validates :title, :due_date, presence: true
  validates :effort_level, inclusion: EFFORT_LEVELS

  scope :in_progress, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end