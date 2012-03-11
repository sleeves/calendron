class Event < ActiveRecord::Base
  belongs_to :calendar
  WEEKDAYS = ["sun", "mon", "tues", "wed", "thurs", "fri"]

  def day
    WEEKDAYS[start_point.wday]
  end

end
