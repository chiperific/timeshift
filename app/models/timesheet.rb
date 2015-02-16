class Timesheet < ActiveRecord::Base
  has_many :timesheet_hours, inverse_of: :timesheet
  has_many :timesheet_categories, inverse_of: :timesheet
  belongs_to :user

  accepts_nested_attributes_for :timesheet_hours, :timesheet_categories

  validates :start_date, :end_date, presence: true
  #validates :week_num, numericality: { greater_than: 0, less_than_or_equal_to: 52 }
  #validates :year, numericality: { greater_than_or_equal_to: 1900, less_than_or_equal_to: 2999 }

  def week_num_to_date
    Date.commercial(self.year, self.week_num, 1).strftime("%m/%d/%Y")
  end

  def week_num_to_date_obj
    Date.commercial(self.year, self.week_num, 1).strftime("%Y/%m/%d")
  end

  def status
    if self.hours_approved.present?
      self.hours_approved.strftime("%m/%d/%Y")
    elsif self.hours_reviewed.present?
      "Denied"
    else
      "Unreviewed"
    end
  end
end
