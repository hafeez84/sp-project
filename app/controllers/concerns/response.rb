module Response
  
  def json_post(object, status = :ok)
    unless status.is_a? Hash
      render json: object.as_json(include: :comments), status: status
    else
      render json: object.as_json(include: :comments), status: status.values[0].to_i
    end
  end

  def json_comment(object, status = :ok)
      render json: object, status: status
  end
end
