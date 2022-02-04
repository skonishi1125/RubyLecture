require 'date'

class User
  attr_accessor :name, :birthday

  def initialize(name, birthday)
    @name = name
    @birthday = birthday
  end

  def display_birthday
    @birthday.strftime('%Y年 %m月 %d日 ')
  end

  def inner_call_display_birthday
    self.display_birthday
    display_birthday
  end
end

birthday = Date.new(2000,1,1)
user = User.new('sato', birthday)
puts user.display_birthday
puts user.inner_call_display_birthday
