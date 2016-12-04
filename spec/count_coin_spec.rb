require File.expand_path '../spec_helper.rb', __FILE__
require 'count_coins'

describe "CountCoins" do
  # There are four types of common coins in US currency:
  #   quarters (25 cents)
  #   dimes (10 cents)
  #   nickels (5 cents)
  #   pennies (1 cent)

  # There are 6 ways to make change for 15 cents:
  #   A dime and a nickel;
  #   A dime and 5 pennies;
  #   3 nickels;
  #   2 nickels and 5 pennies;
  #   A nickel and 10 pennies;
  #   15 pennies.

  subject { Object.new.extend(CountCoins) }

  it "finds 6 ways to make change for 15 cents" do
    expect(
      subject.make_change_recurse(15)
    ).to eq(6)
    expect(
      subject.make_change_iterate(15)
    ).to eq(6)
  end

end
