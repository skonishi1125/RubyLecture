def yield_test
  yield(1, 2)
end
## ブロックを引数として渡している。
## yieldで定義したメソッドが引数として呼ばれ、a=1, b=2が入る
puts yield_test { |a, b| a + b}

# &をつけた仮引数で定義すると、ブロックオブジェクトで受け取れる
def yield_test2(&proc)
  proc.call(1, 2)
end
puts yield_test2 { |a,b| a + b}

def is_block
  if block_given?
    yield
  else
    puts 'ブロック未定義です'
  end
end

is_block { puts 'ブロックを定義しています'}
is_block