def solve(a,b)
  ((a.chars - b.chars) + (b.chars - a.chars)).join
end

p solve("xyab","xzca") == "ybzc"