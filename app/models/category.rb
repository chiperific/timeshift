class Category < ActiveRecord::Base
  belongs_to :department

  validates :name, :department_id, :active, presence: true

  def payroll_relevant_cats(payroll_start, payroll_end)
    timesheet_ids = Timesheet.where{ (start_date >= payroll_end) & (end_date >= payroll_start) }.map { |t| t.id } # thanks Squeel!!
    TimesheetCategory.where(timesheet_id: timesheet_ids, category_id: self.id)
  end

  def payroll_hours(payroll_start, payroll_end)
    relevant_ts_cats = self.payroll_relevant_cats(payroll_start, payroll_end)
    if !relevant_ts_cats.blank?
      summed_hsh = relevant_ts_cats.group(:timesheet_id).sum(:hours)
      hours = summed_hsh.map { |k, v| v.to_f }.sum
    else
      #summed_hsh = {}
      hours = 0
    end
    hours
  end

  def payroll_total(start_date, end_date, period, year)

    relevant_ts_cats = self.payroll_relevant_cats(start_date, end_date)
    usr_rate_x_hours_ary = []

    relevant_ts_cats.each do |c|
      user_rate = c.user.payroll_hourly_rate(period, year)
      usr_rate_x_hours_ary << c.hours * user_rate
    end
    usr_rate_x_hours_ary.sum
  end

end
