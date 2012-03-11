class Week
  attr_accessor :events, :time

  def initialize(start_date)
    @events = Event.within_range(start_date.to_date)
  end

  def css_class
  end

  def mon
    day('mon')
  end

  def tues
    day('tues')
  end

  def wed
    day('wed')
  end

  def thurs
    day('thurs')
  end

  def fri
    day('fri')
  end

  def sat
    day('sat')
  end

  def sun
    day('sun')
  end

  def start_event(day)
    events.select do |e|
      e.start_point.strftime("%H%M") == time.strftime("%H%M") && e.day == day
    end
  end

  def end_event(day)
    events.select do |e|
      e.end_point.strftime("%H%M") == time.strftime("%H%M") && e.day == day
    end
  end

  def during_event(day)
    events.select do |e|
      e.start_point.strftime("%H%M") < time.strftime("%H%M") && e.end_point.strftime("%H%M") > time.strftime("%H%M") && e.day == day
    end
  end

  def no_event(day)

  end

  def day(day)
    if start_event(day).any?
      { :css_class => "start_event", :text => start_event(day).first.title }
    elsif during_event(day).any?
      { :css_class => "during_event" }
    elsif end_event(day).any?
      { :css_class => "end_event" }
    else
      {:css_class => "no_event"}
    end
  end

end
=begin 

  {:css_class => "", :text => ""}

=end
