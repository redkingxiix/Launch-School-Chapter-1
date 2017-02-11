names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  p names[0]
  names.shift
  break if names.length == 0
end
#names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
#loop do
#  puts names.shift
#  break if names.empty?
#end
