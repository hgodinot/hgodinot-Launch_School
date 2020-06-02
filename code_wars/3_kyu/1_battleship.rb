def clean_diagonals?(array)
  array.each do |position|
    return false if array.include?([position[0] - 1, position[1] - 1])
    return false if array.include?([position[0] - 1, position[1] + 1])
    return false if array.include?([position[0] + 1, position[1] - 1])
    return false if array.include?([position[0] + 1, position[1] + 1])
  end
  true
end

def validate_battlefield(field)
  ships = []
  
  field.each_with_index do|sub, idx|
    sub.each_with_index do |position, i|
      ships << [idx, i] if position == 1
      return "incorrect symbols, only '1' and '0'" if position != 1 && position != 0
    end
  end
  return false if clean_diagonals?(ships) != true
  ships_count = { 1 => 4, 2 => 3, 3 => 2, 4 => 1}
  ships.each do |position|
    x = position[1]
    y = position[0]
    
    if ships.include?([y, x + 1]) && ships.include?([y, x - 1]) == false
      ship_size = 1
      while ships.include?([y, x + 1])
        return false if ships.include?([y + 1, x])
        ship_size += 1
        return false if ship_size > 4
        x += 1
      end
    elsif ships.include?([y + 1, x]) && ships.include?([y - 1, x]) == false
      ship_size = 1
      while ships.include?([y + 1, x]) do
        return false if ships.include?([y, x + 1])
        ship_size += 1
        return false if ship_size > 4
        y += 1
      end
    elsif ships.include?([y, x - 1]) == false && ships.include?([y - 1, x]) == false
      ship_size = 1
    end
    
    if ship_size != nil 
      ships_count[ship_size] -= 1 
      return false if ships_count[ship_size] < 0
    end
  end
  ships_count.values.all? {|val|val == 0}
end   
      
fields = [
[1, 0, 0, 0, 0, 1, 1, 0, 0, 0],
[1, 0, 1, 0, 0, 0, 0, 0, 1, 0],
[1, 0, 1, 0, 1, 1, 1, 0, 1, 0],
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
[0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1, 0],
[0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

p validate_battlefield(fields) #== true
#algorythm

   #vérifier si voisin à droite. 
      #si oui, confirmer que pas en bas, ou erreur. Si non, regarder si en bas. 
      #continuer à droite, avec cette vérification de en bas à chaque fois. Ou à droite en vérifiant en bas à chaque fois. Le faire 5 fois au max.
      # chaque fois que ship_size est incrémenté, l'effacer de ships. Reprendre que le premier élément à chaque fois ainsi. 
      # si à tout moment dépasse 4 s'arrêter et retourner false. 
      # Quand plus à droite, s'arrêter. ship_count[ship_size] -= 1. If < 0 s'arrêter


=begin
Pas de diagonales
lignes droites
Pas de doublons
Fonction pour détecter voisin
Fonction pour détecter nombre de bateaux avec compteur

Voisin:
If first line (field(0))
Vérifier les diagonales pour chaque case. 


Fonction check
https://www.codewars.com/kata/52bb6539a4cf1b12d90005b7/ruby
=end