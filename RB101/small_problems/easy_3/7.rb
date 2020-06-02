def oddities(array)
  array.select.with_index { |_, idx| idx.even? }
end
