module CountCoins

  # Code from: http://rosettacode.org/wiki/Count_the_coins#Ruby
  # I cannot do better job of implementing these algorithms
  # Instead I am going to benchmark and impliment them.

  # #########################
  # There are four types of common coins in US currency:
  #  quarters (25 cents)
  #  dimes (10 cents)
  #  nickels (5 cents)
  #  pennies (1 cent)
  @@coins = [1, 5, 10, 25]
  # #########################

  def make_change_recurse(amount)
    @cache = Array.new(amount+1){|i| Array.new(@@coins.size, i.zero? ? 1 : nil)}
    do_count(amount, @@coins.length - 1)
  end

  def do_count(n, m)
    if n < 0 || m < 0
      0
    elsif @cache[n][m]
      @cache[n][m]
    else
      @cache[n][m] = do_count(n-@@coins[m], m) + do_count(n, m-1)
    end
  end

  def make_change_iterate(amount)
    n, m = amount, @@coins.size
    table = Array.new(n+1){|i| Array.new(m, i.zero? ? 1 : nil)}
    for i in 1..n
      for j in 0...m
        table[i][j] = (i<@@coins[j] ? 0 : table[i-@@coins[j]][j]) +
                      (j<1        ? 0 : table[i][j-1])
      end
    end
    table[-1][-1]
  end

  #require 'benchmark'

  #Benchmark.bm(8) do |x|
  #Benchmark.bm do |x|
  #  x.report("Recurse") { make_change_recurse( 100_00, [1,5,10,25]) }
  #  x.report("Iterate") { make_change_iterate( 100_00, [1,5,10,25]) }
  #end

end
