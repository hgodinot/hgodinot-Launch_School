def name(array=[])
  array.sample
end 

def activity(array=[])
  array.sample
end 

def sentence(s1, s2)
  "#{s1} went #{s2} today!"
end 


names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))