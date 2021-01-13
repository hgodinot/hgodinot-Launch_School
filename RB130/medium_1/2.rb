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

=begin

require 'minitest/autorun'
require 'minitest/reporters'

require_relative 'text'

Minitest::Reporters.use!

class TextTest < Minitest::Test
  
  def setup
    @file = File.open('sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end
  
  def test_swap
   expected_text = <<~TEXT.chomp
   Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
   Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
   quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
   nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
   dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
   et verius meuris, et pheretre mi.
   TEXT
   assert_equal(expected_text, @text.swap('a', 'e'))
  end
  
  def test_word_count
    assert_equal(72, @text.word_count)
  end
  
  def teardown
    @file.close
  end
  
end
=end