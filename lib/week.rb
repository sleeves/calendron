class Week
  attr_accessor :events

  def initialize(start_date)
    @events = Event.within_range(start_date.to_date)
  end
end
