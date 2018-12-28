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
    let(:equilateral) {{a:10,b:10,c:10}}
    let(:isosceles) {{a:8,b:8,c:5}}
    let(:scalene) {{a:5,b:7,c:10}}

    context "when the request is valid" do

      before {get  '/api/triangle/type', params: equilateral }
      it "triangle type should be equilateral" do
        expect(json['type']).to eq('Equilateral')
      end
    end

    context "when the request is valid" do
      before {get  '/api/triangle/type', params: scalene }
      it "triangle type should be scalene" do
        expect(json['type']).to eq('Scalene')
      end
    end

    context "when the request is valid" do
      before {get  '/api/triangle/type', params: isosceles }
      it "triangle type should be isosceles" do
        expect(json['type']).to eq('Isosceles')
      end
    end

    context "when the request is invalid" do
      let(:inval) {{ a:10, b:7, c:1 }}
      before {get '/api/triangle/type', params: inval }
      it "should return invalid type" do
        expect(json['type']).to eq('Invalid')
      end
    end

    context "when the request is invalid" do
      let(:inval) {{ a:10, b:7, c: "a" }}
      before {get '/api/triangle/type', params: inval }
      it "should return invalid type" do
        expect(response).to have_http_status(422)
      end
    end

  end


end
