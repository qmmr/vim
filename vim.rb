# learn how to use VIM
#
# NAVIGATION:
# h j k l - left, down, up, right
# w W - next beginning of word (code word)
# b B - previous beginning of word (code word)
# ge e - prev / next word end
# gE E - same as above but with code word
#
# 0 g0 - line start
# ^ g^ - first char of the line
# gm - middle of the line
# $ g$- last char of the line
# 
# H - near top
# M - middle
# L - near bottom
#
# ( ) - moves to beginning/end of sentence
# { } - beggining / end of paragraph
# % - bounces between language specific blocks, parenthesis and quotes

# SCROLLING:
# CTRL+y - line up
# CTRL+e - line down
# CTRL+u - 1/2 up
# CTRL+d - 1/2 down
# CTRL+b - top
# CTRL+f - bottom
#
# zt - scroll near top
# zz - scroll middle
# zb - scroll near bottom
#
# 45G 45gg - scroll to specific line
# gg - first line
# G - last line
#
# in vimrc you can 'set ruler' to display info where you are
# and 'set number' to show line numbers at left hand side
#
# fx - finds next x (any char) to jump to next char use ; or , for prev
# Fx - finds prev x
#
# EDITING:
# i a - goes into edit mode after/before cursor
# I - goes to the first non-blank char of the line in the edit mode
# A - goes to the end of the line in edit mode
# o O - opens new line belowe the current / above the current
# r - replace single char
# R - goes into replace mode
# c - delete and goes into insert mode ie. cw - deletes a word, c3w - deletes three words (it also copies the cut text into mem)
# x - delete single char
# dd D - delete line
# yy Y - copy line
# cc C - change line
# J - joins two lines (J5 - joins 5 lines) this removes indent and inserts up to two spaces (which is good for text but not for code)
# gJ - joins without spaces
#
# SHIFTING TEXT:
# << >> in normal mode
# CTRL-d CTRL-t in edit mode
# you can configure the amount of whitespaces in vimrc with these commands:
# set tabstop=2 - global whitespace
# set shiftwidth=2 - related
# set expandtab - use spaces instead of tabs
# set laststatus=2 - show the status line all the time
#
# VISUAL SELECTING:
# vit - visually select inside boundary delimiter text (in this case t stands for HTML tag) but you can use (),[],{},',"
# ie. ci] will change text inside []
# vat - visually select all (text and delimiters)
#
# SEARCH AND REPLACE:
# ? - search before cursor
# / - search after cursor
# n N - next/prev search item
# * # - if your cursor is on the word you are looking for
# g* g# - next / prev partial match
# 
# to select next line after matching use /+number
# ie. /@text/+2 will put cursor two lines after line
# if you want to move the cursor using chars use prefix e
# ie. /@text/e+3 will put cursor before value
#
# to delete text from the current position till the next occurence of search type
# d/rubbish/e<enter>
#
# to copy from current position to the previous occurrence of def type
# y?def<enter>
# 
# SUBSTITUTE:
# % searches all lines in the current document
# omit % to search only in the current line
# complicated searches are possible
# :.,'a s/a/b - this searches from the cursor to mark a
#
# replace first occurence of word with another word in each line
# :%s/warn/notice
# 
# replace all occurences of word
# :%s/warn/notice/g
#
# flags that can be used:
# c - confirm or skip each match
# i - Ignore case
# I - case sensitive
# n - show number of matches
# p - print matching lines
#
#


def custom_method (value)

	<%= flash[:warn] = 'You have been warned!' %>

  @text = value
	if true
		do_one_thing
		some rubbish
		and another one
		this really needs to be deleted
		text = 'single quoted text'
	else
		do_other_thing (text)
		text = "double quoted text"
	end

end

<h1>Welcome to the VIM world!</h1>
<p>This is the first paragraph!</p>
<p>This is the second paragraph!</p>
<p>This is the third paragraph!</p>
<span>gygygy</span>

# replacing text based on the pattern
# :.,'a s/a/b - search and replace from current position (.) up to mark a replaces all a with b
# based on markers that you have previously set or
# based on lines (13 - exact number, +5, -5, 1 - first, $ - last line of buffer, % - all lines in buffer
# /pattern/ - next line where pattern matches (also ?pattern?)
#
# you can specify number of lines for the substitution
# :s/paragraph/sentence/g10
# 
# try
# 133G
# /third
# :'<,'>s/the/a
#
# SEARCH AND REPLACE GLOBAL:
# :[range]g[lobal]/{pattern}/[cmd]
#
# # - show matches with line numbers
# d - delete matching lines
# y - yank matching lines
# normal {command} - execute an extended sequence
#
# ie. to print lines where pattern was found
# :g/paragraph/p
# :g/params[:foo]/# - shows lines where params[:foo] was found
# :g/^$/d - delete blank lines
# :g/pattern/+y - yank lines after matching line
#
# examples with ranges:
# :[range]g[lobal]/{pattern}/[cmd]
#
# :.,+10g/foo/d - delete matches from the cursor through next 10 lines
# :.,'f+2g/foo/# - show lines through 2 lines after mark f
# :.,/bar/g/foo/d - delete lines through next line matching 'bar'
#
# :g/paragraph/normal Header
# 
# REGULAR EXPRESSIONS:
# \v - VERY MAGIC - similar to Perl, Ruby, Python
# to override default MAGIC specify \v
# ie. /\v(.y){3}/
# /<CTRL+r>/<Enter> - pastes a previous search
#
