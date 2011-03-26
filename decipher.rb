def decipher file_name
  # placeholder for encoded message
  msg = ''
  File.open(file_name, 'r') do |txt|  
    while line = txt.gets  
      msg << line.chomp
    end  
  end 
  # removes line breaks if any
  # msg.gsub!(/(?<!\n)\n(?!\n)/, '')
  msg.gsub!(/\\n/, '')
  # get all chars except digits and ,
  letters = msg.scan(/[^\d\,]/)
  # tracks letter position in string
  position = 0
  # makes placeholder with length based on the letters
  outcome = '_' * letters.length

  # splits string and loops over each char
  msg.split(",").each do |v|
    if v.match(/[\d]/)
      # if char is a digit it adds it to position
      position += v.to_i
    else
      # replaces letter at position unless we run out of letters
      outcome[position - 1] = letters.shift unless letters.empty?
      # resets position for the next letter
      position = 0
    end
  end
  # voila! returns decoded message
  outcome
end
puts 'Loading ...'
puts 'Successfuly decoded message:'
puts decipher('code.txt')