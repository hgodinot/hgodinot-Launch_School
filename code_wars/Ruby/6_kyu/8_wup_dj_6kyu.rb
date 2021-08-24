def song_decoder(string)
  string.gsub(/WUB(WUB+)*/, " ").strip
end

p song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB") == "WE ARE THE CHAMPIONS MY FRIEND"
# good but not recognized as such by Code Wars