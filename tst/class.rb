# class Book
#   def initialize(name = '未定義')
#     @name = name # クラス変数
#   end
#   # 変数呼び出し用メソッド
#   def name
#     @name
#   end
  
#   # 変数変更用メソッド
#   def name=(new_name)
#     @name = new_name
#   end
  
# end
# book = Book.new
# puts book.name
# book.name = 'Ruby入門'
# puts book.name

class Book
  attr_accessor :name
  def initialize(name = '未定義')
    @name = name
  end
end
book = Book.new
puts book.name

class Foo
  def self.first_method
    puts 'first'
  end

  class << self
    def second_method
      puts 'second'
    end

    def third_method
      puts 'third'
    end
  end
end

Foo.first_method
Foo.second_method
Foo.third_method