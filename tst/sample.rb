# puts 'Hello'
=begin
country = 'en'

if country == 'ja'
  puts '日本'
else
  puts 'その他'
end
=end

def hello(name: 'Guest', show: false)
  puts "Hello, #{name}."
end
hello(name: 'kojima')
hello(show:true, name:'sato')

 # 複数の引数を取り扱う
 def sum(*values)
  values.inject { |total, n| total + n }
end

puts sum(1,2,3,4,5)

# "**"で、ハッシュ形式で受け取る
def some_method(**kv_values)
  puts kv_values
end

some_method(param1: :aaa, param2: :bbb)