def fibbonaci limit
  i1, i2 = 1, 1
  while i1 <= limit
    yield i1
    i1, i2 = i2, i1 + i2
  end
end
fibbonaci(1000) {|f| print f, " "}