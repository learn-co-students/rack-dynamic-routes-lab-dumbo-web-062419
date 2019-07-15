class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            selected_item = @@items.find{|i| i.name == item_name}
            if selected_item == nil
                resp.status = 400
                resp.write "Item not found"
            else 
                resp.write selected_item.price
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end
end