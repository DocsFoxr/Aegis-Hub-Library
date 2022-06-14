local HttpService = game:GetService("HttpService")
local Api = {}

function Api:FetchAsync(url, method)
    method = method or "GET";
    local request = syn.request({ Url = url, Method = method })

    if request.StatusCode then
        local Proto = {
            StatusCode = request.StatusCode,
            StatusMessage = request.StatusMessage
        }

        if request.StatusCode == 200 then
            function Proto.toJson()
                return { StatusCode = request.StatusCode, Response = request, Data = HttpService:JSONDecode(request.Body), Url = url, Method = method}
            end
        end

        return Proto
    end
end

function Api:GetHashCode()
    local response = Api:FetchAsync("https://aegishub.onrender.com/api/keys/generate").toJson()
    return { response.Data.value, response.StatusCode }
end

function Api:GetVersion()

end

return Api