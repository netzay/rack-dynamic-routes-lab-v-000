class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      if item = @@items.find{|i| i.name}
      resp.write "#{item.price}"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
