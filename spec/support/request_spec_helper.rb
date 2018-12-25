module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    @json ||= JSON.parse(response.body)
  end
end
