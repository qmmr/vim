# LEARNING REGULAR EXPRESSIONS
#
# you can put string first and the check for regex
# or the other way round, doesn't matter
# returns position of found string

s = 'cat and dog'
puts s =~ /cat/
puts /cat/ =~ s

# if not found returns nil so you can do sth like that

if s =~ /cat/
  puts 'Found Cat in string'
end

File.foreach('regextxt').with_index do |line, index|
  puts "#{index}: found \'on\' in #{line}" if line =~ /on/
  puts "#{index}: didn\'t find \'on\' in #{line}" if line !~ /on/
end

# to replace first occurence of text use sub

s2 = s.sub(/Cat/, 'Mouse')
puts s2

# to replace all matches use gsub (g[lobal])

s3 = s.gsub(/a/, '*')
puts s3

# both sub and gsub return string (if no matches are found return original)
# if you want to replace current string use sub! or gsub!
# be careful! they return nil if match is not found!

str = 'now is the time'
str.sub!(/the/, 'a')
puts str
str.gsub!(/i/, '*')
puts str

# regular expressions are objects
# they're instance of class Regexp

str = 'dog and cat'
re = /nd/
puts str =~ re
puts re =~ str

# this means u can create reg exp objects by calling new on the class
# or using %r{...} syntax

/mm\/dd/
Regexp.new("mm/dd")
%r{/mm/dd/}

# REGULAR EXPRESSIONS OPTIONS
# i - case insensitive
# o - substitute once
# m - multiple lines
# x - complex regexp can be written on multiple lines
# encoding options: n - no encoding, u - utf-8
# standard encoding is utf 7-bit characters

name = 'Fats Waller'
puts "My name is #{name}"
puts name =~ /a/
puts name =~ /z/
puts /a/ =~ name
puts /a/.match(name)
puts Regexp.new('all').match(name)

def show_regexp string, pattern
  match = pattern.match(string)
  if match
    "#{match.pre_match}->#{match[0]}<-#{match.post_match}"
  else
    'no match'
  end
end

puts show_regexp 'very interesting', /t/
show_regexp 'Fats Waller', /a/
show_regexp 'Fats Waller', /all/

# escaping special characters ., |, (, ), [, ], {, }, +, \, ^, $, *, ?

show_regexp 'yes | no', /\|/
show_regexp 'yes (no)', /\(no\)/
show_regexp 'are you sure?', /e\?/

# ANCHORS
# by default regexp tries to find first matching pattern and quits
# ^ - match only re at the beggining of line
# $ - only at the end of line
# \A - the beggining of string
# \z - the end of string
# \Z - same but unless string ends with \n in which case it matches just before \n
# \b \B - word and non-word boundaries

puts "\nANCHORS\n---"
str = "this is\nthe time"
print "original line: #{str}"
puts show_regexp str, /^the/
puts show_regexp str, /is$/
puts show_regexp str, /\Athis/
puts show_regexp str, /\Athe/
puts show_regexp str, /\bis/
puts show_regexp str, /\Bis/

# CHARACTER CLASSES
# . ? * $ ^ + {} () | - significance of these chars is turned off inside []

puts "\n---"
str = "Price $12."
puts "\n---"
print "original line: #{str}"
puts "\n---"
print show_regexp str, /[aeiou]/
puts "\n---"
print show_regexp str, /[\s]/
puts "\n---"
print show_regexp str, /[$.]/
puts "\n---"

str = 'see [The PickAxe-page 123]'
puts "\n---"
print "original line: #{str}"
puts "\n---"
print show_regexp str, /[A-F]/
puts "\n---"
print show_regexp str, /[A-Fa-f]/
puts "\n---"
print show_regexp str, /[0-9]/
puts "\n---"
print show_regexp str, /[0-9][0-9]/
puts "\n---"

# You can negate a character class by putting an up arrow or caret (^) immediately after the
# opening bracket:

print show_regexp('Price $12.', /[^A-Z]/)
puts "\n---"
print show_regexp('Price $12.', /[^\w]/)
puts "\n---"
print show_regexp('Price $12.', /[a-z][^a-z]/)
puts "\n---"

# The POSIX character classes in Table 7.2 on page 125 correspond to the ctype(3) macros of
# the same names. They can also be negated by putting an up arrow (or caret) after the ﬁrst
# colon:
puts "\n---"
puts 'POSIX'
puts "\n---"
print show_regexp('Price $12.', /[aeiou]/) # => Pr->i<-ce $12.
puts "\n---"
print show_regexp('Price $12.', /[[:digit:]]/) # => Price $->1<-2.
puts "\n---"
print show_regexp('Price $12.', /[[:space:]]/) # => Price-> <-$12.
puts "\n---"
print show_regexp('Price $12.', /[[:^alpha:]]/) # => Price-> <-$12.
puts "\n---"
print show_regexp('Price $12.', /[[:punct:]aeiou]/) # => Pr->i<-ce $12.
puts "\n---"

# If you want to include the literal characters ] and - within a character class, put them at the
# start or escape them with \

puts "\n---"
print show_regexp(str, /[]]/)
puts "\n---"
print show_regexp(str, /[09\]]/)
puts "\n---"
print show_regexp(str, /[\d\\]/)
puts "\n---"

str = "now is the time"
puts str.gsub(/[az&&[^aeiou]]/, '*')

