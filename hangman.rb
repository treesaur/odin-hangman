words = File.readlines('google-10000-english-no-swears.txt')

p words[rand(words.length - 1)].chomp

class HangMan
  def initialize()
    word = words[rand(words.length - 1)].chomp
    
  end

end