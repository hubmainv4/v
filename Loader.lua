-- İlk yükleme: Anticheat
loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb"))()

-- Servisler
local LogService = game:GetService("LogService")
local StarterGui = game:GetService("StarterGui")

-- Durum takibi
local found = false
local debugMode = true -- DEBUG için true bırak, sonra false yapabilirsin

-- Anlık log dinleme
LogService.MessageOut:Connect(function(message, msgType)
	if debugMode then
		warn("Log geldi: ", message)
	end
	
	if message:find("function expected on argument 1, got nil on hookfunction") then
		if debugMode then
			warn("[✓] Anticheat mesajı bulundu!")
		end
		found = true
	end
end)

-- 2 saniye bekleyelim, anticheat hata mesajı düşecekse düşsün
task.wait(2)

if not found then
	if debugMode then
		warn("[!] Anticheat hatası loglarda bulunamadı.")
	end

	StarterGui:SetCore("SendNotification", {
		Title = "AntiCheat",
		Text = "Anticheat not loaded, please restart the script",
		Duration = 5
	})
else
	if debugMode then
		warn("[✓] Anticheat yüklendi, ana modül çağrılıyor...")
	end

	-- Ana modül yükleniyor
	loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/neo", true))()
end
