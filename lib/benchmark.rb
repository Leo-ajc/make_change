require 'benchmark'
require './lib/count_coins'
include CountCoins

Benchmark.bm do |x|
  x.report("Recurse") { make_change_recurse( 100_00) }
  x.report("Iterate") { make_change_iterate( 100_00) }
end
