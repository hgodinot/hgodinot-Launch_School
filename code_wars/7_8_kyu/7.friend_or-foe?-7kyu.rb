def friend(array)
  array.select {|name| name.length == 4 }
end




p friend(["Ryan", "Kieran", "Mark"]) == ["Ryan", "Mark"]
p friend(["Ryan", "Jimmy", "123", "4", "Cool Man"]) == ["Ryan"]
p friend(["Jimm", "Cari", "aret", "truehdnviegkwgvke", "sixtyiscooooool"]) == ["Jimm", "Cari", "aret"]
p friend(["Love", "Your", "Face", "1"]) == ["Love", "Your", "Face"]