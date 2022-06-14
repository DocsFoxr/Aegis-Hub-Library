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
                return { StatusCode = request.StatusCode, Response = request, Data = HttpService:JSONDecode(request.Body), Url = url, Method = method }
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
    local function Hash_Rounded(sha, values)
        local counter = 0
        local Shart_Hash = ""

        if values > string.len(sha) then
           return print("El value pasado excede la cantidad de valores del sha dado.") 
        end

        Shart_Hash = sha:gsub("%x", function(n)
            if counter <= values then counter += 1 return n else return "" end
        end)

        if Shart_Hash == nil then return "Not Found Version..." else return Shart_Hash end
    end

    local response = Api:FetchAsync("https://api.github.com/repos/DocsFoxr/Aeis-Hub-Library/commits/main").toJson()
    return Hash_Rounded(response.Data.sha, 6)
end

return Api