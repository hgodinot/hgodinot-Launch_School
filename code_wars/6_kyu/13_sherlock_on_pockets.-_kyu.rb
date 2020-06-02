def find_suspects(pockets, allowed_items)
  
  return nil if pockets == {} || pockets == nil || pockets.values.all? {|val| val == nil}
  suspects = []
  
  pockets.each do |key, value|
    value = [] if value == nil
    value.each do |item|
      if allowed_items.include?(item)
      else
        suspects << key
      end
    end
  end
  
  return nil if suspects.length == 0
  suspects.uniq
end


pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

p find_suspects(pockets, [1, 2]) == [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) == nil
p find_suspects(pockets, []) == [:bob, :tom, :jane]
p find_suspects(pockets, [7]) == [:bob, :tom]