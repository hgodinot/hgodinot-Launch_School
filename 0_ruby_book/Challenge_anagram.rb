
  #Ma solution

  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
 comparison = {}
 
  words.each do |word|
    anag = word.split("").sort.join
    comparison[word] = anag
    end 
  
  arr1 = []
  arr2 = []
  arr3 = []
  arr4 = []
  arr5 = []
  
  comparison.each do |word, anag|
    case anag
    when "demo" 
      arr1 << "#{word} "
    when "enno"
      arr2 << "#{word} "
    when "deit"
      arr3 << "#{word} "
    when "eilv"
      arr4 << "#{word} "
    when "flow"
      arr5 << "#{word} "
    end 
  end 
  
  print arr1
  print arr2
  print arr3
  print arr4
  print arr5




  
        
    
  