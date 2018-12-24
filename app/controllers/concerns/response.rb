module Response
  def json_response(post, status = :ok)
    render json: post.as_json(include: :comments) , status: status
  end
end
