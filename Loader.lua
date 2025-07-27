local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Global değişken ekle
local heartbeatConn = nil

local function checkac()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb.lua", true))()
    wait(1)

    local lastPosition = rootPart.Position
    local threshold = 50

    localPlayer.CharacterAdded:Connect(function(char)
        character = char
        rootPart = char:WaitForChild("HumanoidRootPart")
        lastPosition = rootPart.Position
    end)

    local function StartTPDetection()
        lastPosition = rootPart.Position
        if heartbeatConn then
            heartbeatConn:Disconnect()
        end

        heartbeatConn = RunService.Heartbeat:Connect(function()
            if not rootPart or not rootPart.Parent then return end

            local currentPosition = rootPart.Position
            local distance = (currentPosition - lastPosition).Magnitude

            if distance > threshold then
                warn("AC FLAG: Teleport tespit edildi! Mesafe:", math.floor(distance))
                localPlayer:Kick("Anti Cheat failed, dm vasli for issues.")
            end
            lastPosition = currentPosition
        end)
    end

    -- Global fonksiyon yap
    _G.StopTPDetection = function()
        if heartbeatConn then
            heartbeatConn:Disconnect()
            heartbeatConn = nil
            print("TP Detection durduruldu")
        end
    end

    StartTPDetection()
    
    local ohNumber1 = 999
    local ohNumber2 = -113.3239517211914
    local ohNumber3 = 50.57432174682617
    local ohBoolean4 = false

    game:GetService("ReplicatedStorage").Connections.RemoteFunction:InvokeServer(ohNumber1, ohNumber2, ohNumber3, ohBoolean4)

    wait(2.0)
    
    _G.StopTPDetection()
end

checkac()

-- Loader kodu aynı kalıyor, sadece buton click event'ini değiştir:
btn.MouseButton1Click:Connect(function()
    if gameInfo.link then
        -- Global fonksiyonu çağır
        if _G.StopTPDetection then
            _G.StopTPDetection()
        end
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(gameInfo.link))()
        end)
        if not success then
            warn("Failed to load script:", err)
        end
    else
        warn("No link provided for", gameInfo.name)
    end
    
    loader:Destroy()
end)
