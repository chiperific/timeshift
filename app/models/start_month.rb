class StartMonth < ActiveRecord::Base
  belongs_to :app_default, validate: true

  validates_presence_of :month
  validates_inclusion_of :month, in: Date::MONTHNAMES
end
