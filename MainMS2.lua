local Monke = loadstring(game:HttpGet("https://github.com/nixyr/Kiwi-Files/raw/main/KiwiUI.lua"))()

local Kiwi = Monke.Window("Kiwi Library")
local KiwiTab = Kiwi:Tab("Main")
local KiwiSec = KiwiTab:Section("Section1")

_G.On = nil

--[Required]--
local player = game.Players.LocalPlayer
local repli = game:GetService("ReplicatedStorage").Events
local modulex = require(game:GetService("ReplicatedStorage").SharedModules.Data.Tools)
local modulex = require(game:GetService("ReplicatedStorage").SharedModules.Constants)
local LoadModule = require(game:GetService("ReplicatedStorage").LoadModule);
local Mod = require(game:GetService("ReplicatedStorage").SharedModules.ChunkUtil)
local ChunkUtil = LoadModule("ChunkUtil");
local Network = LoadModule("Network");
local LocalData = LoadModule("LocalData");
local Blocks = LoadModule("Blocks");
local GetCurrencyMultiplier = LoadModule("GetCurrencyMultiplier");
local GetRebirthCost = LoadModule("GetRebirthCost");
local GetSellTeleport  = LoadModule("GetSellTeleport")
local GetBackpackStatus = LoadModule("GetBackpackStatus");
local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(5,Enum.EasingStyle.Linear)

local total = 5000000
local donesell = 0

function bypass_teleport(v)
    if player.Character and 
    player.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(v)
        local a = tween_s:Create(player.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
        -- a.Completed:Wait()
        -- print('Teleporting Done!')
    end
end

function TeleportTO(cframeplace)
if player.Character then
player.Character.HumanoidRootPart.CFrame = cframeplace
end
end

function CurrentBackpackValue()
local totalores = 0
for i,v in pairs(LocalData:GetData("BackpackInventory")) do
totalores = Blocks[v[1]]["Value"][2] * v[2]
end
return totalores
end

function breakblock(pos)
local args = {
	[1] = pos
}

repli.MineBlock:FireServer(unpack(args))
end

function getPartBelow()
local Character = game.Players.LocalPlayer.Character
local Foot = Character.RightFoot
local RayOrigin = Foot.Position
local RayDirection = Vector3.new(0, -1, 0)

local Params = RaycastParams.new()
Params.FilterType = Enum.RaycastFilterType.Blacklist
Params.FilterDescendantsInstances = {
	Character
}

local Result = workspace:Raycast(RayOrigin, RayDirection, Params)

if Result then
local RayInstance = Result.Instance
return RayInstance
end

return nil
end

KiwiSec:Toggle("Auto Farm", function(toggle)
	spawn(function()
		shared.toggle = toggle
		if shared.toggle then
		_G.On = true
		else
			_G.On = false
		end

		while true do
		if _G.On then
		local closest = getPartBelow()

		if closest ~= nil then
		local Pos = closest.Position

		local NewPos = Mod.worldToCell(Pos)

		task.spawn(function()
			breakblock(NewPos)
			end)
		end
		end
		task.wait()
		end
		end)
	end)

KiwiSec:Button("Save Position", function()
 spawn(function()
	LPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	TweenPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	end)
	end)

KiwiSec:Toggle("Sell", function(autosell)
spawn(function()
	_G.SellAuto = autosell
	while _G.SellAuto do
	if CurrentBackpackValue() >= 499992 or CurrentBackpackValue() == 499992 then
	Network:FireServer("Teleport", GetSellTeleport(game.Players.LocalPlayer));
	game:GetService("ReplicatedStorage").Events.QuickSell:FireServer()
	elseif CurrentBackpackValue() == 0 or CurrentBackpackValue() <= 20 then
		if player.Character and
	player.Character:FindFirstChild('HumanoidRootPart') then
	local cf = CFrame.new(TweenPos)
	local a = tween_s:Create(player.Character.HumanoidRootPart,tweeninfo, {
		CFrame = cf
	})
	a:Play()
	end
  end
	wait(1)
  end
 end)
end)


KiwiSec:Button("Print backpack", function()
	spawn(function()
	print(totalores)
	end)
	end)

KiwiSec:Button("TP To Pos", function()
	TeleportTO(LPos)
end)

KiwiSec:Button("TweenToLastPost", function()
	bypass_teleport(TweenPos)
end)