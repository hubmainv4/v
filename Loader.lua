





loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb"))()
wait(1)

local successacb, result = pcall(function()
    return hookfunction(nil, function() end)
end)

-- Eğer hata mesajı belirttiğin şekilde değilse, uyarı gönder
if not successacb or not tostring(result):find("function expected on argument 1, got nil on hookfunction") then
    -- Roblox notification mesajı
    local StarterGui = game:GetService("StarterGui")

    StarterGui:SetCore("SendNotification", {
        Title = "AntiCheat",
        Text = "Anticheat not loaded, please restart the script",
        Duration = 5,
    })
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/neo", true))()
end

end
