module Response
  def json_post(object, status = :ok)
      render json: object.as_json(include: :comments), status: status
  end

  def json_comment(object, status = :ok)
      render json: object, status: status
  end
end
