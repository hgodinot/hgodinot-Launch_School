def fields(string)
  p string.split(/[ ,\t]+/)
end 

fields("Pete,201,Student")

fields("Pete \t 201    ,  TA")

fields("Pete \t 201")
