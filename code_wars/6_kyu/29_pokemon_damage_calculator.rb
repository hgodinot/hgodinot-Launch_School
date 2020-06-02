# Pokemon Damage Calculator

def calculate_damage(your_type, opponent_type, attack, defense)
require "pry"  
  hsh_fire = {"fire" => 0.5, "water" => 0.5, "electric" => 1, "grass" => 2}
  hsh_electric = {"fire" => 1, "water" => 2, "electric" => 0.5, "grass" => 1}
  hsh_water = {"fire" => 2, "water" => 0.5, "electric" => 0.5, "grass" => 0.5}
  hsh_grass = {"fire" => 0.5, "water" => 2, "electric" => 1, "grass" => 0.5}
  
  return 50 * (attack.to_f / defense) * hsh_fire[opponent_type] if your_type == "fire"
  return 50 * (attack.to_f / defense) * hsh_electric[opponent_type] if your_type == "electric"
  return 50 * (attack.to_f / defense) * hsh_water[opponent_type] if your_type == "water"
  return 50 * (attack.to_f / defense) * hsh_grass[opponent_type] if your_type == "grass"

end

p calculate_damage("fire", "water", 100, 100) == 25
p calculate_damage("grass", "water", 100, 100) == 100
p calculate_damage("electric", "fire", 100, 100) == 50
p calculate_damage("grass", "electric", 57, 19) == 150
p calculate_damage("grass", "water", 40, 40) == 100
p calculate_damage("grass", "fire", 35, 5) == 175
p calculate_damage("fire", "electric", 10, 2) == 250