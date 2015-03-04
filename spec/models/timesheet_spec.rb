require 'spec_helper'

describe Timesheet do
  let(:timesheet) { FactoryGirl.create(:timesheet)}

  subject { timesheet }

  it 'has all the fields' do
    should respond_to(:start_date)
    should respond_to(:end_date)
    should respond_to(:user_id)
    should respond_to(:hours_approved)
    should respond_to(:timeoff_approved)
    should respond_to(:hours_reviewed)
    should respond_to(:timeoff_reviewed)
    should respond_to(:created_at)
    should respond_to(:updated_at)
  end

  it { should be_valid }

  describe "when start_date is not present" do
    before { timesheet.start_date = nil }
    it { should_not be_valid }
  end

  describe "when end_date is not present" do
    before { timesheet.end_date = nil }
    it { should_not be_valid}
  end

end