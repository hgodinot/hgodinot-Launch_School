arr = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
     
arr.collect! { |word| word.split(" ") }
arr.flatten!
p arr 