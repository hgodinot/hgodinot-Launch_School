def dms(number)
  minutes = (number - number.floor) * 60
  seconds = (minutes - minutes.floor) * 60
  format("%d°%02d'%02d\"", number.floor, minutes.floor, seconds.floor )
end 

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")