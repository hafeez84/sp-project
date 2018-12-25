require "rails_helper"

RSpec.describe "Triangle API", type: :request do

  describe "GET /api/triangle " do
    before {get '/api/triangle'}

    it "should return use case of endpoint" do
      expect(response.body).to match(/Please send 3 side of triange as params/)
    end
    it "should return status code 200" do
      expect(response).to have_http_status(200)
    end

  end

  describe "GET /api/triangle/type " do
    let(:scalene) {{a:5,b:7,c:10}}

    context "when the request is valid" do
      before {get  '/api/triangle/type', params: scalene}

      it "returns triangle type of scalene" do
        expect(response['type']).to eq('scalene')
      end
      # eq('equilateral') | eq('isosceles') |
    end

  end

end
