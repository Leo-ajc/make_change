
Deployed at: https://rocky-fortress-79177.herokuapp.com/15

When approaching this problem.

http://www.cyber-dojo.org/enter/show/D4FCAF0657

My natural approach was a recursive algorithm with a cache.

I found pre-existing soltions at: 

http://rosettacode.org/wiki/Count_the_coins#Ruby

I cannot do cleaner Ruby style implementation of these algorithms.
Instead I am going to benchmark and impliment them, with a Sinatra API and a Angular2 front-end, https://github.com/Leo-ajc/my-proj

Normally Iterate functions are faster than recursive, however with this benchmarking the recursive function was faster. 

I haven't done the analysis to produced any big O notion.

```ruby
require 'benchmark'
require './lib/count_coins'
include CountCoins

Benchmark.bm do |x|
  x.report("Recurse") { make_change_recurse( 100_00) }
  x.report("Iterate") { make_change_iterate( 100_00) }
end
```

```
$ruby ./lib/benchmark.rb
```

```
           user     system      total        real
Recurse  0.010000   0.000000   0.010000 (  0.015588)
Iterate  0.040000   0.010000   0.050000 (  0.044302)
```
