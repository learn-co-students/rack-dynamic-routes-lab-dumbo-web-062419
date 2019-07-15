class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        search_term = req.params["q"]

        if req.path == "/items/#{search_term}"
            @@items.each do |item|
                if item.name == search_term
                    resp.write "#{item.price}"
                    resp.status = 200
                else
                    resp.write "Item not found"
                    resp.status = 400
                end
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

end