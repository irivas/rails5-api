module Response
  def json_response_index(object, page, per_page)
    render json: {
      collection: object,
      meta: { total: object.count, page: page, per_page: per_page }
    },
    status: :ok
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def no_content_response
    head :no_content
  end
end
