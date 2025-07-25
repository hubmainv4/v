-- 1) Anticheat modülünü yükle
local ACB_URL = "https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb"
local NEO_URL = "https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/neo"

loadstring(game:HttpGet(ACB_URL, true))()
wait(1)

-- 2) Servisleri al
local LogService   = game:GetService("LogService")
local StarterGui   = game:GetService("StarterGui")

-- 3) Durum takibi
local found = false
local conn  -- MessageOut bağlantısını daha sonra kapatabilmek için

-- 4) Anlık log dinlemesi
conn = LogService.MessageOut:Connect(function(message)
    -- Zaten bulunduysa ekstra işlem yapma
    if found then 
        conn:Disconnect()
        return 
    end

    -- Hata mesajı gelip gelmediğine bak
    if type(message) == "string" and message:find("function expected on argument 1, got nil on hookfunction") then
        found = true
        conn:Disconnect()

        -- Anticheat yüklenmiş, ana modülü çağır
        loadstring(game:HttpGet(NEO_URL, true))()
    end
end)

-- 5) Zaman aşımı: 3 saniye içinde hata mesajı gelmezse uyarı ver
task.delay(3, function()
    if not found then
        if conn then conn:Disconnect() end
        StarterGui:SetCore("SendNotification", {
            Title    = "AntiCheat",
            Text     = "Anticheat not loaded, please restart the script",
            Duration = 5,
        })
    end
end)
