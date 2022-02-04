num = 0

begin
  p 10 / num
rescue ZeroDivisionError => e
  p e
  num = 2
  retry
end

puts '終了'