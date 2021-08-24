class Triangle
  def initialize (x, y, z)
    @triangle = [x, y, z].sort
    invalid?
  end

  def kind
    case @triangle.uniq.size
    when 1 then "equilateral"
    when 2 then "isosceles"
    else        "scalene"
    end
  end

  private

  def invalid?
    raise ArgumentError.new "All sides must be greater than 0" if @triangle.min <= 0
    raise ArgumentError.new "Greater side can't be greater than the sum of the two other sides" if @triangle.last > @triangle[0,2].sum
  end
end
