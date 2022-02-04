module SampleModule
  CONST_NUM = 100

  def const_num
    CONST_NUM
  end
end

puts SampleModule::CONST_NUM
include SampleModule
puts const_num
puts CONST_NUM