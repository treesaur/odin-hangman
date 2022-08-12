

class HangMan
  def initialize()
    words = File.readlines('google-10000-english-no-swears.txt')
    @selected_word = words[rand(words.length - 1)].chomp
    @tries = 6
    @guessedLetters = []
    @guess = @selected_word.chars.map { |letr| "-" }
  end

  def play
    displayProgess
    until gameOver?
      userGuess = letterGuess.downcase
      if letterCorrect?(userGuess)
        insertLetter(userGuess)
      else
        @tries -= 1
      end
      displayProgess
    end
  end

  def gameOver?
    if @tries == 0
      puts "You lost, the selected word was '#{@selected_word}'."
      return true
    elsif @guess == @selected_word
      puts "You won!"
      return true
    end

    false
  end

  def letterGuess
    puts "Enter a one-letter guess."
    letter = gets.chomp()
    while letter.length != 1 || !letter.match(/[a-z]/i) || @guessedLetters.include?(letter)
      puts "Enter a one-letter guess. No repeats, numbers, special characters, or whitespaces."
      letter = gets.chomp()
    end

    @guessedLetters.push(letter)
    letter
  end

  def letterCorrect?(char)
    @selected_word.include?(char)
  end

  def insertLetter(char)
    @selected_word.each_char.with_index do |ele, idx|
      if char == ele
        @guess[idx] = char
      end
    end
  end

  def displayProgess
    puts "Tries remaining: #{@tries}"
    puts "Your guess: #{@guess.join(" ")}"
    puts "Letters guessed: #{@guessedLetters}"
  end

end


game = HangMan.new
game.play