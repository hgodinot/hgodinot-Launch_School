
def longest_sentence(text)
  sentences = text.split(/[\.!\?]/).map { |sentence| sentence.split }
  sentences.sort_by! { |words| words.length }
  puts sentences[-1].join(" ")
  puts "This sentences is #{sentences[-1].length} words long."
end

p longest_sentence("I think so. I thought so ? Yes !!!")