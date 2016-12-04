require File.expand_path '../spec_helper.rb', __FILE__

describe "My Sinatra Application" do
  context 'valid params' do

    it "should allow accessing the home page" do
      amount = 15
      combinations = 6
      get "/#{amount}"

      json = JSON.parse last_response.body
      expect(json["combinations"]).to eq(combinations)
      expect(last_response).to be_ok
    end
  end

  context 'invalid params' do

    context 'amount greater than 1000' do
      it 'returns 400 status' do
        amount = 1001
        get "/#{amount}"

        json = JSON.parse last_response.body
        expect(json["message"]).to match("Parameter must be within 1..1000")
        expect(json["errors"]["amount"]).to match("Parameter must be within 1..1000")
        expect(last_response.status).to eq(400)
      end
    end

    context 'amount not an integer' do
      it 'return 400 status' do
        amount = 'foobar'
        get "/#{amount}"

        json = JSON.parse last_response.body
        expect(json["errors"]["amount"]).to match(amount)
        expect(json["errors"]["amount"]).to match('is not a valid Integer')
        expect(last_response.status).to eq(400)
      end
    end
  end
end
