# puts (1..1000).to_a.find { |v| v * v > 900 }
# ['H', 'A', 'L'].collect {|v| print v.succ, ' '}
# ['H', 'A', 'L'].map {|v| print v.succ, ' '}
# f = File.open('tst')
# f.each do |line|
  # puts "The line reads: #{line}"
# end
# f.each_with_index do |line, index|
  # puts "#{index}: #{line}"
# end
# f.close

# puts [1, 3, 5, 7].inject(0) {|sum, element| sum + element}
# puts [1, 3, 5, 7].inject {|sum, element| sum + element}
# puts [1, 3, 5, 7].inject(:+)
# puts [1, 3, 5, 7].inject(1) {|sum, element| sum * element}
# puts [1, 3, 5, 7].inject {|sum, element| sum * element}
# puts [1, 3, 5, 7].inject(:*)

# a = [1, 3, 'cat']
# h = {dog: 'canine', fox: 'lupine'}
# enum_a = a.to_enum
# enum_h = h.to_enum
# p enum_a.next
# p enum_h.next
# p enum_a.next
# p enum_h.next

# short_enum  = [1, 2, 3].to_enum
# long_enum   = ('a'..'z').to_enum
# loop do
  # puts "#{short_enum.next} - #{long_enum.next}"
# end
results = []
# "cat".each_char.with_index { |c, index| results << [c, index] }
"cat".each_char.with_index { |c, index| results << {c => index} }
p results

enum = "cat".enum_for(:each_char)
p enum.to_a.join

enum_slice = (1..10).enum_for(:each_slice, 3)
p enum_slice.to_a