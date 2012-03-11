class Event < ActiveRecord::Base

  scope :within_range, lambda { |start| where("start_point <= ? AND start_point >= ?",start + 7.days, start.to_date ) }

  belongs_to :calendar
  WEEKDAYS = ["sun", "mon", "tues", "wed", "thurs", "fri"]

  def day
    WEEKDAYS[start_point.wday]
  end

end
