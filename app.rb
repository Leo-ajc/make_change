require 'sinatra'
require 'sinatra/param'
require 'json'
require './lib/count_coins'

class MakeChange < Sinatra::Base
  include CountCoins
  helpers Sinatra::Param

  before do
    content_type :json
  end

  get '/:amount' do
    param :amount, Integer, required: true, range: 1..1000

    combo = make_change_recurse(params[:amount])
    { combinations: combo }.to_json
  end

end
