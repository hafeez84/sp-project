class Api::TriangleController < ApplicationController
  before_action :t_params

  def index
    render json: {
      status: 200,
      message: "Please send 3 side of triange as params",
    }.to_json
  end

  def type
    sides = t_params.values
    a = sides[0].to_i
    b = sides[1].to_i
    c = sides[2].to_i

    unless ( c < (a+b) && ( b < (a+c)) && ( a < (b+c)) )
      type = :Invalid
    else
      type = case sides.uniq.length
          when 1 then :equilateral
          when 2 then :isosceles
          when 3 then :scalene
      end
    end
    render json: {status: "SUCCESS", message:"#{type}"}, status: :ok
  end

  private
  def t_params
    params.permit(:a, :b, :c)
  end
end
