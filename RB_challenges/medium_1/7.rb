require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, number)
    1.upto(31) do |n|
      return Date.new(year, month, n) if wday?(weekday, n) && order?(number, n)
    end
  end
  
  protected
  
  attr_reader :month, :year
  
  def wday?(wday, n)
    wday == :monday && Date.new(year, month, n).monday? ||
    wday == :tuesday && Date.new(year, month, n).tuesday? ||
    wday == :wednesday && Date.new(year, month, n).wednesday? ||
    wday == :thursday && Date.new(year, month, n).thursday? ||
    wday == :friday && Date.new(year, month, n).friday? ||
    wday == :saturday && Date.new(year, month, n).saturday? ||
    wday == :sunday && Date.new(year, month, n).sunday? 
  end
  
  def order?(ord, n)
    ord == :teenth && (13..19).include?(n) ||
    ord == :first && (1..7).include?(n) ||
    ord == :second && (8..14).include?(n) ||
    ord == :third && (15..21).include?(n) ||
    ord == :fourth && (22..28).include?(n) ||
    ord == :last && Date.new(year, month, n).next_day(7).month != month
  end
end
