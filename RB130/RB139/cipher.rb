class Cipher
  def self.rotate(str, num)
    str.chars.map { |letter| convert(letter, num) }.join
  end

  def self.convert(l, n)
    return l if !l.match(/[A-Za-z]/)
    case situation(l, n)
    when "plus" then (l.ord + n % 26).chr
    when "minus" then (l.ord - n % 26).chr
    else (l.ord - (26 % n)).chr
    end
  end

  def self.situation(l, n)
    return "plus" if plus?(l, n)
    return "minus" if minus?(l, n)
    "other"
  end

  def self.plus?(l, n)
    l.match(/[A-Z]/) && (l.ord + n % 26).chr.match(/[A-Z]/) ||
      l.match(/[a-z]/) && (l.ord + n % 26).chr.match(/[a-z]/)
  end

  def self.minus?(l, n)
    l.match(/[N-Z]/) && (l.ord - n % 26).chr.match(/[A-Z]/) ||
      l.match(/[n-z]/) && (l.ord - n % 26).chr.match(/[a-z]/)
  end
end
