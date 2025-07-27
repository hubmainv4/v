local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")


local function checkac()

loadstring(game:HttpGet("https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/acb.lua", true))()

wait(1)

local lastPosition = rootPart.Position
local threshold = 50
local heartbeatConn = nil


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

local function StopTPDetection()
                if heartbeatConn then
		heartbeatConn:Disconnect()
		heartbeatConn = nil
	end
end

StartTPDetection()
	
local ohNumber1 = 999
local ohNumber2 = -113.3239517211914
local ohNumber3 = 50.57432174682617
local ohBoolean4 = false

game:GetService("ReplicatedStorage").Connections.RemoteFunction:InvokeServer(ohNumber1, ohNumber2, ohNumber3, ohBoolean4)

wait(1.0)
	
StopTPDetection()

end

checkac()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer


if CoreGui:FindFirstChild("LoaderUI") then
	CoreGui.LoaderUI:Destroy()
end

local loader = Instance.new("ScreenGui")
loader.Name = "LoaderUI"
loader.Parent = CoreGui
loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


local games = {
	{ name = "SOA | CryptHub Neo", link = "https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/neo.lua" },
	{ name = "SOA | CryptHub Old", link = "https://raw.githubusercontent.com/hubmainv4/v/refs/heads/main/Ch" },
}


local main = Instance.new("Frame")
main.Name = "Main"
main.BackgroundColor3 = Color3.fromRGB(13, 12, 12)
main.Position = UDim2.new(0.43, 0, 0.39, 0)
main.Size = UDim2.new(0.145, 0, 0.27, 0)
main.BorderSizePixel = 0
main.Parent = loader


local uiStroke = Instance.new("UIStroke")
uiStroke.Parent = main
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(102, 0, 204)
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uiGradient = Instance.new("UIGradient")
uiGradient.Parent = uiStroke
uiGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(102, 0, 204)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 30))
}

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Parent = main
title.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
title.Position = UDim2.new(0.04, 0, 0.02, 0)
title.Size = UDim2.new(0.92, 0, 0.11, 0)
title.Font = Enum.Font.RobotoMono
title.Text = "CryptHub Loader"
title.TextColor3 = Color3.fromRGB(89, 0, 255)
title.TextStrokeTransparency = 0
title.TextWrapped = true
title.TextSize = 18
title.BorderSizePixel = 0
local titleCorner = Instance.new("UICorner")
titleCorner.Parent = title
titleCorner.CornerRadius = UDim.new(0, 2)


local holder = Instance.new("Frame")
holder.Name = "Holder"
holder.Parent = main
holder.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
holder.Position = UDim2.new(0.04, 0, 0.17, 0)
holder.Size = UDim2.new(0.92, 0, 0.78, 0)
holder.BorderSizePixel = 0

local holderStroke = Instance.new("UIStroke")
holderStroke.Parent = holder
holderStroke.Thickness = 2
holderStroke.Color = Color3.fromRGB(24, 24, 24)
holderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local holderCorner = Instance.new("UICorner")
holderCorner.Parent = holder
holderCorner.CornerRadius = UDim.new(0, 4)


local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Name = "ScrollingFrame"
scrollingFrame.Parent = holder
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
scrollingFrame.ScrollBarThickness = 6
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Active = true

local padding = Instance.new("UIPadding")
padding.Parent = scrollingFrame
padding.PaddingTop = UDim.new(0, 10)

local gridLayout = Instance.new("UIGridLayout")
gridLayout.Parent = scrollingFrame
gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
gridLayout.CellPadding = UDim2.new(0, 10, 0, 10)
gridLayout.CellSize = UDim2.new(0, 165, 0, 25)


local dragging = false
local dragStart, startPos

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = UserInputService:GetMouseLocation()
		startPos = main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = UserInputService:GetMouseLocation() - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)


local function addHoverEffect(button)
	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(102, 0, 204)}):Play()
	end)
	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(14, 14, 14)}):Play()
	end)
end


for _, gameInfo in ipairs(games) do
	local btn = Instance.new("TextButton")
	btn.Parent = scrollingFrame
	btn.Text = ("load %s"):format(gameInfo.name)
	btn.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
	btn.BorderSizePixel = 0
	btn.Size = UDim2.new(0, 165, 0, 25)
	btn.Font = Enum.Font.RobotoMono
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.TextWrapped = true
	
	local btnStroke = Instance.new("UIStroke")
	btnStroke.Parent = btn
	btnStroke.Thickness = 1
	btnStroke.Color = Color3.fromRGB(24, 24, 24)
	btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.Parent = btn
	btnCorner.CornerRadius = UDim.new(0, 4)
	
	addHoverEffect(btn)
	
	btn.MouseButton1Click:Connect(function()
		if gameInfo.link then
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
end


RunService.Heartbeat:Connect(function()
	uiGradient.Rotation = (uiGradient.Rotation + 4) % 360
end)
