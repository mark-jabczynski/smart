require './parser'

options = { 
  path: ARGV[0],
  operation: ARGV[1],
  number_of_tops: (ARGV[2] && ARGV[2].to_i)
}.compact

puts Parser.new(**options).call
