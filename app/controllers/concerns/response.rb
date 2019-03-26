module Response
  def json_response_index(collection, page, per_page)
    render status: :ok,
    json: {
      collection: collection,
      meta: { total: collection.count, page: page, per_page: per_page }
    }
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def no_content_response
    head :no_content
  end
end
