class BeerSong
  def self.verse(num1)
    self.verse(num1)
  end

  def self.verses(n1, n2)
    (n2..n1).to_a.reverse.each.with_object([]) { |n, result| result << self.verse(n) }.join("\n")
  end
    
  def self.verse(n)
    case n
    when (3..99) then "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
                      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
    when 2 then "2 bottles of beer on the wall, 2 bottles of beer.\n" \
                "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    when 1 then "1 bottle of beer on the wall, 1 bottle of beer.\n" \
                "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0 then "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  def self.lyrics
    self.verses(99, 0)
  end
end
