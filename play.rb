class Hangman

  def initialize
   	
  	@letters = ('a'..'z').to_a
  	@word = words.sample
    @lives = 7
    @correct_guesses = []
    @word_teaser = ""


    @word.first.size.times do
      @word_teaser += "_ "
    end
  	
  end


  def words
  	[
  		["cricket","A game played by gentleman"],
  		["jogging","We are not walking.."],
  		["celebrate","Remebering special moments"],
  		["continent","There are 7 of these"],
  		["Exotic", "Not from around here...."],
  	]
  end

  def print_teaser last_guess = nil


    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
    
  end


  def update_teaser last_guess

    new_teaser = @word_teaser.split

  new_teaser.each_with_index do |letter, index |

# replace a blank value with guessed letters if matches in word
    if letter == '-' && @word.first.split[index] == last_guess
      new_teaser[index] = last_guess
    end   
  end  

  @word_teaser = new_teaser.join(' ') 
  end
 
  def make_guess
    if @lives > 0
      puts "Enter a letter"
    guess = gets.chomp 


   good_guess = @word.first.include? guess  
   if guess == "exit"
    puts "Thank you for playing"
  elsif good_guess
    puts "You are correct!" 
      
   if good_guess
    puts "Good guess"

 
    print_teaser guess

    if @word.first == @word_teaser.split.join
      puts "Congratulations.....you won this round!"
    else
    make_guess
  else
     @lives -= 1
    puts "Try again, you have  #{@lives} lies left.Try again"
    make_guess
  end
else
  puts "Game over!.....better luck next time"
end
end


  def begin

  	puts "New game started ....your word is #{word.first.size} characters long"
    puts "To exit game at any point type 'exit' "
    print_teaser

  	puts "Clue: #{@word.last}"

  
  end


end

game = Hangman.new
game.begin