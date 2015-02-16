FactoryGirl.define do
  factory :user do
    fname                 "Factory"
    lname                 "User"
    email                 "default@admin.com"
    admin                 true
    active                true
    department_id         1
    supervisor_id         nil
    password              "foobar"
    password_confirmation "foobar"
    annual_time_off       158.5
    standard_hours        80
  end

  factory :users_staff, class: User do
    fname                 "Factory"
    lname                 "User2"
    email                 "active@user.com"
    admin                 true
    active                true
    department_id         1
    supervisor_id         1
    password              "foobar"
    password_confirmation "foobar"
    annual_time_off       158.5
    standard_hours        80
    start_date            Date.new(2010, 1, 1)
  end

  factory :category do
    name          "factory category"
    department_id 1
    active        true
  end

  factory :department do
    name          "factory department"
    active        true
  end   


  factory :timesheet do
    user_id     1
    start_date  "2015/01/01"
    end_date    "2015/01/07"
  end

  factory :timesheet_hour do
    day_num        2
    hours          7
    timeoff_hours  4.5
  end

  factory :timesheet_category do
    timesheet_id   1
    category_id    1
    hours          7
  end

  factory :app_default do
    name "default"
  end

  factory :weekday do
    name            "Monday"
    abbr            "Mon"
    day_num         1
    app_default_id  1
  end

  factory :it_email do
    email           "it@email.com"
    app_default_id  1
  end

  factory :start_month do
    month           "January"
    app_default_id  1
  end

  factory :timeoff_accrual do
    accrual_type    "Annual"
    app_default_id  1
  end

  factory :pay_period do
    period_type     "Bi-weekly"
    app_default_id  1
  end

  factory :holiday do
    name            "Best Chip Day"
    month           1
    day             "24"
    app_default_id  1
  end
end