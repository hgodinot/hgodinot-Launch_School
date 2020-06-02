VALID_CHOICES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

correspondance = { 'r' => 'rock',
                   'p'=> 'paper',
                   'sc'=> 'scissors',
                   'sp'=> 'spock',
                   'l' => 'lizard' }

def prompt(message)
  puts("=>#{message}")
end

def win?(first, second)
  (first == "rock"  && second == ("scissors" || "lizard")) ||
    (first == "paper" && second == ("rock" || "spock")) ||
    (first == "scissors" && second == ("paper" || "lizard")) ||
    (first == "spock" && second == ("scissors" || "rock")) ||
    (first == "lizard" && second == ("paper" || "spock"))
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")

  elsif win?(computer, player)
    prompt("You lost!")

  else
    prompt("It's a tie!")

  end
end

player_score = 0
computer_score = 0

loop do
  abreviated_choice = ''
  choice =''

  loop do
    prompt("Choose one: 'r' for rock, 'p' for paper, 'sc' for scissors, 
    'sp' for spock, 'l' for lizard.")
    abreviated_choice = gets.chomp

    if VALID_CHOICES.include?(correspondance[abreviated_choice])
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  
  choice = correspondance[abreviated_choice]

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_result(choice, computer_choice)
  case display_result(choice, computer_choice)
  when "You won!" then player_score += 1
  when "You lost!" then computer_score +=1
  end
  
  puts "Your score is #{player_score}. Computer score is #{computer_score}."
  
  if player_score == 5 
    prompt("Congratulation, you are the grand winner with 5 wins")
    break
  elsif computer_score == 5
    prompt("Sorry, computer is the grand winner with 5 wins")
    break
  end
end

=begin
  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
=end 