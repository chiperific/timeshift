class TimesheetCategory < ActiveRecord::Base
  belongs_to :timesheet
  belongs_to :category

  validates :category_id, presence: true
  validates :hours, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 80 }
end
