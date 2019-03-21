module Response
  def json_response(object, page, per_page)
    render json: {
      collection: object,
      meta: { total: object.count, page: page, per_page: per_page }
    },
    status: :ok
  end
end
