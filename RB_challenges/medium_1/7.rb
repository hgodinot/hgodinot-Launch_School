require 'date'
class Meetup
  ORD = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3, 
                thursday: 4, friday: 5, saturday: 6}
                
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(weekday, order)
    day = 1
    (1..7).each { |n| day = n if Date.new(@year, @month, n).wday == ORD[weekday] }
    case order
    when :first
    when :second then day += 7
    when :third then day += 14
    when :fourth then day += 21
    when :teenth then day += (day >= 6 ? 7 : 14)
    else 
      day += 7 until (Date.new(@year, @month, day) + 7).month != @month
    end
    Date.new(@year, @month, day)
  end
end

# Other way

class Meetup
  require 'date'
  def initialize(month, year)
    @year = year
    @month = month
  end
  
  def day(wday, ord)
    start = case ord
    when :first then 1
    when :second then 8
    when :third then 15
    when :fourth then 22
    when :last then Date.civil(@year, @month, -1).mday - 6
    when :teenth then 13
    end
    loop do
      break if Date.new(@year, @month, start).strftime('%A').downcase.to_sym == wday
      start += 1
    end
    Date.new(@year, @month, start)
  end