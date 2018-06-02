require './factory'

User = Factory.new(:name, :address, :age)
User1 = Factory.new(:name, :address, :age)
Lots = Factory.new(:a, :b, :c, :d, :e, :f)
l = Lots.new(11, 18, 5, 65, 89, 66)
jone = User1.new('Joe Smith', '123 Maple, Anytown NC', 21)
joe = User.new('Joe Smith', '123 Maple, Anytown NC', 21)
joe1 = User.new('Joe Smith', '123 Maple, Anytown NC', 21)
dave = User.new('Dave Will', 'New York', 35)

puts "++++++++++++++++++++    Method  'new'   ++++++++++++++++++++++++++++"
puts "User = Factory.new(:name, :address, :age)"
puts "joe = User.new('Joe Smith', '123 Maple, Anytown NC', 21) =>"
p joe
puts "____________________________________________________________________"
puts "++++++++++++++++++++    Method  '=='   +++++++++++++++++++++++++++++"
p joe
p joe1
puts "joe == joe1 #=> #{joe == joe1}"
puts "--------------------------------------------------------------------"
p joe
p dave
puts "joe == dave #=> #{joe == dave}"
puts "____________________________________________________________________"
puts "++++++++++++++++++++    Method  '[]','[]='  ++++++++++++++++++++++++"
p joe
puts "joe.name #=> #{joe.name}"
puts "joe[:age] #=> #{joe[:age]}"
puts "____________________________________________________________________"
puts "++++++++++++++    Method  #each, #each_pair   ++++++++++++++++++++++"
p l
puts "l.each {|value| puts value} => "
 l.each { |value| puts value }
puts "--------------------------------------------------------------------"
puts "joe.each_pair {|attr, value| puts(''#'{attr} => '#'{value}') }"
joe.each_pair {|attr, value| puts("#{attr} => #{value}") }
puts "____________________________________________________________________"
puts "++++++++++++++++++++    Method  #eql?   ++++++++++++++++++++++++++++"
p jone
p joe
p joe1
puts "jone.eql? joe #=> #{jone.eql? joe}"
puts "joe.eql? joe1 #=> #{joe.eql? joe1}"
puts "____________________________________________________________________"
puts "++++++++++++++++++++    Method  'hash'   +++++++++++++++++++++++++++"
p joe
p "joe.hash #=> #{joe.hash}"
puts "____________________________________________________________________"
puts "+++++++++++++++    Method  #inspect, # to_s   ++++++++++++++++++++++"
p joe
puts "joe.inspect => #{joe.inspect}"
puts "--------------------------------------------------------------------"
p joe
puts "joe.to_s => #{joe.to_s}"
puts "____________________________________________________________________"
puts "+++++++++++++++++++++    Method  #members  +++++++++++++++++++++++++"
p l
p jone
puts "l.members => #{l.members}"
puts "jone.members => #{jone.members}"
puts "____________________________________________________________________"
puts "+++++++++++++++++++++    Method  #select   +++++++++++++++++++++++++"
p l
puts "l.select {|x| (x % 2).zero } => #{ l.select { |x| (x % 2).zero? } }"
puts "____________________________________________________________________"
puts "+++++++++++++++    Method  #values, # to_a   ++++++++++++++++++++++"
p joe
puts "joe.to_a => #{joe.to_a}"
puts "____________________________________________________________________"
puts "+++++++++++++++++++    Method  #values_at   ++++++++++++++++++++++++"
puts "User = Factory.new(:name, :address, :age)"
puts "joe = User.new('Joe Smith', '123 Maple, Anytown NC', 21) =>"
puts "joe.values_at 0, 2 #=> #{joe.values_at(1)}"
puts "____________________________________________________________________"
puts "++++++++++++++++    Method  #length, #size   +++++++++++++++++++++++"
puts "User = Factory.new(:name, :address, :age)"
puts "joe = User.new('Joe Smith', '123 Maple, Anytown NC', 21) =>"
puts "joe.size #=> #{joe.size}"
puts "--------------------------------------------------------------------"
puts "Lots = Factory.new(:a, :b, :c, :d, :e, :f)"
puts "l = Lots.new(11, 18, 5, 65, 89, 66)"
puts "l.length #=> #{l.length}"
puts "____________________________________________________________________"
puts "++++++++++++++++++++    Method  'to_h'   +++++++++++++++++++++++++++"
p joe
p "joe.to_h #=> #{joe.to_h}"
puts "_______________________     END     ________________________________"
