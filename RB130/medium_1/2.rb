class TextAnalyzer
  def process
    file = File.open('text.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} line" }
analyzer.process { |file| puts "#{file.split.count} words" }