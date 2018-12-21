class Api::TriangleController < ApplicationController
  before_action :t_params
  def type
    sides = t_params.values
    if sides[0] + sides[1] < sides[2] || sides[1] + sides[2] < sides[0] || sides[0] + sides[2] < sides[1]
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
