begin
  val = 10 / 0
  puts val
rescue => e
  p e
  puts '0で割ることはできません。'
end