-- URLs
local ACB_URL = "https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb"
local NEO_URL = "https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/neo"

-- 1) Anticheat modülünü yükle
print("[AntiCheat] Loading ACB module…")
loadstring(game:HttpGet(ACB_URL, true))()
wait(1)

-- 2) Hookfunction kontrolü: pcall ile doğrudan test ediyoruz
local ok, err = pcall(function()
    -- Burada argüman tipi hatası alırızsa hookfunction gerçekten var demektir
    hookfunction(nil, function() end)
end)

-- Şu iki durumdan birini "başarılı yükleme" olarak kabul ediyoruz:
-- a) pcall false dönüp err mesajı "function expected on argument 1" içeriyor
-- b) pcall true dönüyorsa (örneğin bazı exploitler hatayı sessizce bastırmış olabilir)
local loaded
if not ok and tostring(err):find("function expected on argument 1") then
    loaded = true
elseif ok then
    loaded = true
else
    loaded = false
end

-- 3) Sonuç
if loaded then
    print("[AntiCheat] Detected hookfunction → Loading NEO module…")
    loadstring(game:HttpGet(NEO_URL, true))()
else
    warn("[AntiCheat] hookfunction bulunamadı veya yanlış yüklendi:", err)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "AntiCheat",
        Text = "Anticheat not loaded properly, please restart the script",
        Duration = 5,
    })
end
