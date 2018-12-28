class Api::TriangleController < ApplicationController
  before_action :t_params

  def index
    render json: {
      status: 200,
      message: "Please send 3 side of triange as params",
    }.to_json
  end

  def type
    begin
      sides = t_params.values.map { |e| e.to_i  }
      raise "Please send valid sides for Triangle !" if sides.include? 0 # it'll result zero if there is none number value and zero
    rescue Exception => e
      render json: {status: 422, error: e.message}, status: 422
      return
    end
    unless ( sides[2] < ( sides[0] + sides[1] ) && ( sides[1] < ( sides[0] + sides[2] )) && ( sides[0] < ( sides[1] + sides[2] )) )
      type = :Invalid
    else
      type = case sides.uniq.length
          when 1 then :Equilateral
          when 2 then :Isosceles
          when 3 then :Scalene
      end
    end
    render json: {status: "SUCCESS", type: type }, status: :ok
  end

  private
  def t_params
    params.permit(:a, :b, :c)
  end
end
