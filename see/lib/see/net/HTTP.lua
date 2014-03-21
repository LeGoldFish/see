--@native http

--@import see.io.IOException
--@import see.net.HTTPResponse
--@import see.net.URL
--@import see.util.ArgumentUtils
--@import see.event.impl.HTTPSuccessEvent
--@import see.event.impl.HTTPFailureEvent

--[[
    Makes a blocking HTTP request.
    @param see.net.Url:url The URL to request from.
    @param see.base.String:postData Post data to send if this is a POST request.
    @return see.base.String The body of the response.
    @throw see.util.InvalidArgumentException if the args are incorrect.
    @throw see.io.IOException If the request fails.
]]
function HTTP.sync(url, postData)
    --[[if postData then postData = cast(postData, "string") end
    local f = postData and http.post or http.get
    local handle = f(url.string:lstr(), postData)
    return HttpResponse:new(String:new(handle.readAll()), handle.getResponseCode())]]

    ArgumentUtils.check(1, url, URL)
    if postData then postData = cast(postData, "string") end
    
    HTTP.async(url, postData)

    local event = Events.pull(HTTPSuccessEvent, HTTPFailureEvent)
    if event.ident == "http_success" then
        return event.response
    else
        throw(IOException:new(STR("Request to ", event.url, " failed.")))
    end
end

--[[
    Makes an asynchronous HTTP request.
    @param see.net.Url:url The URL to request from.
    @param see.base.String:postData Post data to send if this is a POST request.
    @throw see.util.InvalidArgumentException if the args are incorrect.
]]
function HTTP.async(url, postData)
    ArgumentUtils.check(1, url, URL)
    if postData then postData = cast(postData, "string") end
    http.request(url.string:lstr(), postData)
end