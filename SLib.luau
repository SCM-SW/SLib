-- Made by ScientistM!          

local SLib = {StringLib = {} , MathLib = {}, LCharLib = {}, DecompLib = {DecompFT = {}, ExpDecomp = decompile}, Roplayers = {}, BlankFunc = function() end, RoserviceUseClassN = true, ExpN = identifyexecutor ~= nil and identifyexecutor(), Romodules = {{`Base64.luau`, `https://raw.githubusercontent.com/SCM-SW/SLib/refs/heads/main/Base64.luau`}, {`HashLib.luau`, `https://raw.githubusercontent.com/SCM-SW/SLib/refs/heads/main/HashLib.luau`}}, ManualGPlugins = true}
local RospfTbl = {ScreenGUIs = {}, Roinstances = {}}
local OnRoplayerJLFLT = {OnRoplayerAdded = {}, OnRoplayerRemoving = {}}
local Cloneref = cloneref or function(...) return ... end
local GeneratedGUIs = {}
local GeneratedGUIsET = {}

SLib.StringLib.RemoveFromStr = function(Val, ValB) 
	return string.gsub(Val, ValB, ``)
end

for Index, Val in pairs(game:GetChildren()) do  
	local RBXServiceS, RBXService = pcall(game.GetService, game, Val.ClassName)  

	if RBXServiceS and RBXService ~= nil then 
		SLib[SLib.StringLib.RemoveFromStr(SLib.RoserviceUseClassN and RBXService.ClassName or RBXService.Name, ` `)] = RBXService
	end
end

SLib.RoserviceUseClassN = nil

SLib.LocalPlayer = SLib.Players.LocalPlayer
SLib.PlayerGui = SLib.LocalPlayer:FindFirstChildOfClass(`PlayerGui`)

if makefolder ~= nil then
	makefolder(`SLib`)

	for Index, Val in pairs(SLib.Romodules) do 		
		if isfile ~= nil and writefile ~= nil then
			local RomoduleN = Val[1]
			local RomoduleURL = Val[2]

			if not isfile(`SLib/`..RomoduleN) then
				writefile(`SLib/`..RomoduleN, game:HttpGet(RomoduleURL))
			end 

			if readfile ~= nil then
				SLib[SLib.StringLib.RemoveFromStr(RomoduleN, `.luau`)] = loadstring(readfile(`SLib/`..RomoduleN))()  
			end
		end
	end

	SLib.Romodules = nil
end 

SLib.StringLib.GetFLetter = function(Val)
	return string.sub(Val, 1, 1)
end

SLib.StringLib.GetLLetter = function(Val)
	return string.sub(Val, -1)
end

SLib.MathLib.Ort = function(...)
	local FArgs = {}
	local OrtNum = 0
	local FArgsCount = 0

	for Index, Val in pairs(FArgs) do 
		Val = tonumber(Val)
		OrtNum += Val
		FArgsCount += 1
	end 

	return FArgsCount ~= 0 and OrtNum/FArgsCount or 0
end

SLib.ForeachInGC = function(IncTbl, Rofunc, Usecust)
	if getgc ~= nil then
		local Rogc = getgc(IncTbl)

		if Usecust then
			for Index, Val in pairs(Rogc) do 
				Rofunc(Index, Val)
			end
		else
			table.foreach(Rogc, Rofunc)
		end
	end

	return nil
end

SLib.LCharLib.LocalChar = function()
	return SLib.LocalPlayer.Character 
end

SLib.LCharLib.LocalHumanoid = function()
	return SLib.LocalPlayer.Character and SLib.LocalPlayer.Character:FindFirstChildOfClass(`Humanoid`)
end

SLib.LCharLib.LocalHumanoidRootPart = function()
	return SLib.LocalPlayer.Character and SLib.LocalPlayer.Character:FindFirstChild(`HumanoidRootPart`)
end

SLib.LCharLib.LocalHumanoidRigType = function()
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 

	if LocalHumanoid ~= nil then
		return LocalHumanoid.RigType
	end

	return `Humanoid is not found!`
end

SLib.LCharLib.SetLocalWalkSpeed = function(Val)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 
	Val = tonumber(Val)

	if LocalHumanoid ~= nil then
		LocalHumanoid.WalkSpeed = Val
	end
end

SLib.LCharLib.SetLocalJumpHeight = function(Val)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 
	Val = tonumber(Val)

	if LocalHumanoid ~= nil then
		LocalHumanoid.JumpHeight = Val
	end
end

SLib.LCharLib.SetLocalHipHeight = function(Val)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 
	Val = tonumber(Val)

	if LocalHumanoid ~= nil then
		LocalHumanoid.HipHeight = Val
	end
end

SLib.LCharLib.SitChar = function(Val)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 

	if LocalHumanoid ~= nil then
		LocalHumanoid.Sit = Val == true
	end
end

SLib.LCharLib.JumpChar = function(Val)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 
	local LocalJumpingStateE = LocalHumanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)  

	if LocalHumanoid ~= nil then 
		LocalHumanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
		LocalHumanoid:ChangeState(Enum.HumanoidStateType.Jumping)  
		LocalHumanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, LocalJumpingStateE)
	end
end

SLib.LCharLib.SetLocalRobodyStateE = function(Rostate, RostateE)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 

	if LocalHumanoid ~= nil then 
		LocalHumanoid:SetStateEnabled(Rostate, RostateE)
	end
end

SLib.LCharLib.SetLocalPStand = function(Val)
	local LocalHumanoid = SLib.LCharLib.LocalHumanoid() 

	if LocalHumanoid ~= nil then
		LocalHumanoid.PlatformStand = Val == true 
	end
end

SLib.LCharLib.GNoclipChar = function(DetailedNcl) 
	local LocalChar = SLib.LocalPlayer.Character
	DetailedNcl = DetailedNcl == true and `GetDescendants` or `GetChildren` 

	if LocalChar then
		for Index, Val in pairs(LocalChar[DetailedNcl](LocalChar)) do 
			if Val:IsA(`BasePart`) then
				Val.CanCollide = false
			end
		end
	end
end 

SLib.DecompLib.DecompSupported = getscriptbytecode ~= nil and decompile ~= nil
SLib.DecompLib[SLib.ExpN..`Decomp`] = decompile

SLib.DecompableFromClCheck = function(Val)
	return typeof(Val) == `Instance` and (Val.ClassName == `Script` and Val.RunContext == Enum.RunContext.Client or Val.ClassName == `LocalScript` or Val.ClassName == `ModuleScript`)
end

SLib.DecompLib.MedalDecomp = function(Val)
	if SLib.DecompableFromClCheck(Val) then
		local GSBCS, GSBC = getscriptbytecode(Val)

		return `MedaAPI doesn't have Public API.`
	end

	return `Wrong obj selected!`
end

SLib.DecompLib.SignalhubMedal = function(Val, HideRoupvalues, HideRofuncsnms, Hiderofuncsline) 
	if SLib.DecompableFromClCheck(Val) then
		local GSBCS, GSBC = pcall(getscriptbytecode, Val)

		if not GSBCS then
			return `Getscriptbytecode failed! - ` .. GSBC
		end

		local DecompInfo = request({
			Url = "https://starhub.dev/api/v1/decompile",
			Body = SLib.HttpService:JSONEncode({
				bytecode = SLib.Base64.Encode(GSBC) ,
				use_cache = true,
				HideUpvalues = HideRoupvalues == true,
				HideFunctionsNames = HideRofuncsnms == true,
				HideFunctionsLine = Hiderofuncsline == true,
			}),
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
		}) 

		if DecompInfo.StatusCode == 200 then 
			return DecompInfo.Body
		end

		return `SignalhubMedal has failed! - ` .. DecompInfo.Body .. `.`
	end

	return `Wrong obj selected!`
end

SLib.DecompLib.KonstantDecomp = function(Val) 
	if SLib.DecompableFromClCheck(Val) then
		local GSBCS, GSBC = pcall(getscriptbytecode, Val)  

		if not GSBCS then
			return `Getscriptbytecode failed! - ` .. GSBC
		end

		local DecompInfo = request({
			Url = "https://api.plusgiant5.com/konstant/decompile",
			Body = GSBC,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
			},
		})

		if DecompInfo.StatusCode == 200 then 
			return DecompInfo.Body
		end

		return `KonstantDecomp has failed! - ` .. DecompInfo.Body .. `.`
	end

	return `Wrong obj selected!`
end

SLib.GAdonisRemote = function()
	for Index, Val in pairs(SLib.ReplicatedStorage:GetChildren()) do 
		if Val:FindFirstChild(`__FUNCTION`) then  
			return Val
		end
	end

	return nil
end

SLib.BypAdonis = function()
	if getgc ~= nil and SLib.GAdonisRemote() ~= nil then
		for Index, Val in pairs(getgc(true)) do  
			if type(Val) == `table` and rawget(Val, `indexInstance`) then
				setreadonly(Val, false)
				Val[1] = nil
				setreadonly(Val, true) 
			end   
		end
	end
end 

SLib.GenerateGUI = function(SpfGUI)
	local GeneratedGUI = Instance.new(`ScreenGui`)
	GeneratedGUIs[GeneratedGUI] = true

	return Instance.new(`ScreenGui`)
end

SLib.NObj = function(ObjClassN, SpfObj)
	if ObjClassN == `ScreenGui` then
		return `There is GenerateGUI for ScreenGUIs!`
	end

	local NObj = Instance.new(ObjClassN)
	table.insert(RospfTbl.Roinstances, NObj)

	return NObj
end 

SLib.GetScriptbytecodeHash = function(Val, HashMTDN)
	local GSBCS, GSBC = pcall(getscriptbytecode, Val)
	HashMTDN = HashMTDN or `md5`

	if not GSBCS then
		return `Getscriptbytecode failed! - ` .. GSBC
	end

	return SLib.HashLib[HashMTDN](GSBC)
end 

SLib.RoGModuleCheck = function(Val) 
	if Val.ClassName == `ModuleScript` then
		local DecompS, DecompInfo = pcall(SLib.DecompLib.SignalhubMedal, Val, true, true, true)

		if not DecompS then
			return DecompInfo
		end

		DecompInfo = string.lower(DecompInfo)

		return string.find(DecompInfo, `getfenv`) == nil and string.find(DecompInfo, `debug.info`) ~= nil
	end

	return `Given arg is not ModuleScript!`
end

local GRandomScObj = nil
local GRandomScObjT = {} 
local GRandomScObjTIECountForMathRandom = 1

if SLib.PlayerGui ~= nil then 
	for Index, Val in pairs(SLib.PlayerGui:GetChildren()) do 
		if Val.ClassName == `LocalScript` then
			table.insert(GRandomScObjT, Val) 
			GRandomScObjTIECountForMathRandom += 1
		end
	end

	GRandomScObj = GRandomScObjT[math.random(1, GRandomScObjTIECountForMathRandom)]
end

if GRandomScObj == nil then
	GRandomScObj = SLib.NObj(`LocalScript`)
	GRandomScObj.Name = `Animate`

	task.spawn(function()
		while true do 
			GRandomScObj.Parent = SLib.LocalPlayer
			break
		end
	end)
end

SLib.BlankFunc(`Using getsenv ~= nil and getsenv(GRandomScObj) looks like rovulnerable.`)

local GEnvPropNT = {} 

for Index, Val in pairs(getgenv()) do  
	getfenv(SLib.BlankFunc)[Index] = nil
	GEnvPropNT[Index] = Val
	GEnvPropNT[Val] = true
end

SLib.GFakeEnvF = function()
	return SLib.GFakeEnv
end

SLib.NonexpGEnv = function(Prop) 
	return Prop == `getfenv` and SLib.GFakeEnvF or GEnvPropNT[Prop] == nil and getfenv()[Prop] or nil
end

SLib.GFakeEnv = setmetatable({script = GRandomScObj, _G = {}, shared = {}, AnimationList = SLib.BlankFunc}, {
	__index = function(Self, Prop)  
		return SLib.NonexpGEnv(Prop) or nil
	end,

	__newindex = function(Self, Prop, Val)

	end
})         

local GRandomDebuginfol = math.random(25, 95)  

local GFakeFDebuginfoT = {
	Debuginfo_s = function()
		return GRandomScObj
	end,

	Debuginfo_l = function()
		return GRandomDebuginfol
	end,

	Debuginfo_n = function()
		return `AnimationList`
	end,

	Debuginfo_a = function()
		return
	end,

	Debuginfo_f = SLib.BlankFunc
} 

SLib.GModuleHF = function(GLModuleVal)
	local GLModuleValType = type(GLModuleVal)  

	if GLModuleValType == `table` then
		for Index, Val in pairs(GLModuleVal) do  
			local ValType = type(Val)  

			if ValType == `function` then
				local REnvGFenv = nil

				REnvGFenv = hookfunction(getfenv(GLModuleVal).getfenv, function(...)
					local GArgs = {...}

					if GArgs[1] == 2 then 
						SLib.GNotify(`Game.CAE.GEnv2 found!`, 2, 8) 
						return SLib.GFakeEnv
					end

					if GArgs[1] == GFakeFDebuginfoT.Debuginfo_f then 
						SLib.GNotify(`Game.CAE.GEnvBlankF found!`, 2, 8) 
						return SLib.GFakeEnv
					end

					return REnvGFenv(...)
				end)  

				local REnvGDebugInfo = nil 

				REnvGDebugInfo = hookfunction(getfenv(Val).debug.info, function(...)
					local GArgs = {...}

					if GArgs[1] == 2 then
						local GFakeFDebuginfoAnswT = {}

						for Index = 1, 5 do 
							table.insert(GFakeFDebuginfoAnswT, GFakeFDebuginfoT[`Debuginfo_`..string.sub(GArgs[2], Index, Index)])
						end

						SLib.GNotify(`Game.CAE.Debuginfo2 found!`, 2, 8) 
						return table.unpack(GFakeFDebuginfoAnswT)
					end

					return REnvGDebugInfo(...)
				end)
			end

			if ValType == `table` then
				SLib.GModuleHF(Val)
			end
		end
	end

	if GLModuleValType == `function` then
		local REnvGFenv = nil

		REnvGFenv = hookfunction(getfenv(GLModuleVal).getfenv, function(...)
			local GArgs = {...}

			if GArgs[1] == 2 then 
				SLib.GNotify(`Game.CAE.GEnv2 found!`, 2, 8) 
				return SLib.GFakeEnv
			end  

			if GArgs[1] == GFakeFDebuginfoT.Debuginfo_f then 
				SLib.GNotify(`Game.CAE.GEnvBlankF found!`, 2, 8) 
				return SLib.GFakeEnv
			end

			return REnvGFenv(...)
		end) 

		local REnvGDebugInfo = nil 

		REnvGDebugInfo = hookfunction(getfenv(GLModuleVal).debug.info, function(...)
			local GArgs = {...}

			if GArgs[1] == 2 then
				local GFakeFDebuginfoAnswT = {}

				for Index = 1, 5 do 
					table.insert(GFakeFDebuginfoAnswT, GFakeFDebuginfoT[`Debuginfo_`..string.sub(GArgs[2], Index, Index)])
				end

				SLib.GNotify(`Game.CAE.Debuginfo2 found!`, 2, 8) 
				return table.unpack(GFakeFDebuginfoAnswT)
			end

			return REnvGDebugInfo(...)
		end)
	end

	return GLModuleVal
end 

SLib.GNotify = warn

SLib.GModule = function(Val) 
	if Val.ClassName ~= `ModuleScript` then
		return `Invalid obj selected!`
	end

	local GModule = SLib.GModuleHF(require(Val))

	return GModule
end
 
SLib.OnRoplayerAdded = function(...)
	for Index, Val in pairs({...}) do  
		if type(Val) == `function` then 
			table.insert(OnRoplayerJLFLT.OnRoplayerAdded, Val)
		end   
	end
end 

SLib.OnRoplayerRemoving = function(...)
	for Index, Val in pairs({...}) do  
		if type(Val) == `function` then 
			table.insert(OnRoplayerJLFLT.OnRoplayerRemoving, Val)
		end   
	end
end 
 
SLib.GameSpeficNilInstances = function(GNilInstanceN, GNilInstanceClassN)
	local GNilInstances = {}

	if getnilinstances ~= nil then
		for Index, Val in pairs(getnilinstances()) do 
			if Val.Name == GNilInstanceN and Val.ClassName == GNilInstanceClassN then
				table.insert(GNilInstances, Val)
			end
		end
	end

	return GNilInstances
end

SLib.ClearGNilInstances = function(GNilInstanceN, GNilInstanceClassN)
	if getnilinstances ~= nil then
		for Index, Val in pairs(getnilinstances()) do 
			getnilinstances()[Index] = nil
		end
	end
end

SLib.GPlayerArgList = {}

SLib.GPlayerArgList.Arg_all = function()
	return SLib.Roplayers
end

SLib.GPlayerArgList.Arg_others = function() 
	local GPlayers = {}

	for Index, Val in pairs(SLib.Roplayers) do 
		if Val.UserId ~= SLib.LocalPlayer.UserId then
			table.insert(GPlayers, Val)
		end
	end

	return GPlayers
end

SLib.GPlayerArgList.Arg_me = function() 
	local GPlayers = {}

	table.insert(GPlayers, SLib.LocalPlayer)

	return GPlayers
end

SLib.GPlayerArgList.Arg_random = function()
	return {SLib.Roplayers[math.random(1, #SLib.Roplayers)]}
end

SLib.GPlayer = function(Val) 
	local GPlayersF = SLib.GPlayerArgList[`Arg`..Val]

	if GPlayersF ~= nil then
		return GPlayersF()
	end

	local GPlayers = {}

	for A_1, A_2 in pairs(SLib.Roplayers) do 
		if string.sub(string.lower(A_2.Name), 1, #Val) == string.lower(Val) then
			table.insert(GPlayers, A_2)
		end
	end

	return GPlayers
end

SLib.GCamera = SLib.Workspace.CurrentCamera

SLib.Workspace.ChildAdded:Connect(function(Child)
	if Child.ClassName == `Camera` then
		SLib.GCamera = Child
	end
end)

SLib.RenderStepped = SLib.RunService.RenderStepped 
SLib.RenderStpW = SLib.RenderStepped.Wait

SLib.WebSocket = game:GetService(`WebSocketService`)

SLib.fireproximitypromptonserv = function(Val, ValB)
	if replicatesignal ~= nil and Val.ClassName == `ProximityPrompt` then
		if ValB and 0 >= Val.HoldDuration then
			replicatesignal(Val.ButtonHoldBeganActionReplicated, SLib.LocalPlayer)
			replicatesignal(Val.ButtonHoldEndedActionReplicated, SLib.LocalPlayer)
		end

		replicatesignal(Val.TriggeredActionReplicated, SLib.LocalPlayer)
		replicatesignal(Val.TriggerEndedActionReplicated, SLib.LocalPlayer)
	end
end

SLib.fireproximitypromptoncl = function(Val, ValB)
	if firesignal ~= nil and Val.ClassName == `ProximityPrompt` then
		if ValB and 0 >= Val.HoldDuration then
			firesignal(Val.InputHoldBegin, SLib.LocalPlayer)
			firesignal(Val.InputHoldEnd, SLib.LocalPlayer)
		end

		firesignal(Val.Triggered, SLib.LocalPlayer)
		firesignal(Val.TriggerEnded, SLib.LocalPlayer)
	end
end

SLib.fireproximityprompt = function(Val, ValAmount, ValB)
	for Index = 1, tonumber(ValAmount) do 
		SLib.fireproximitypromptoncl(Val, ValB)
		SLib.fireproximitypromptonserv(Val, ValB)
	end
end

SLib.fireclickdetectoronserv = function(Val, ValB)
	if replicatesignal ~= nil and Val.ClassName == `ClickDetector` then
		replicatesignal(Val.MouseActionReplicated, SLib.LocalPlayer, ValB)
	end
end

SLib.fireclickdetectoroncl = function(Val, ValB)
	if firesignal ~= nil then
		firesignal(Val.MouseHoverEnter, SLib.LocalPlayer)
		firesignal(Val[ValB], SLib.LocalPlayer)
		firesignal(Val.MouseHoverLeave, SLib.LocalPlayer)
	end
end

SLib.fireclickdetector = function(Val, ValAmount, ValB)
	for Index = 1, tonumber(ValAmount) do 
		SLib.fireclickdetectoronserv(Val, ValB)
		SLib.fireclickdetectoroncl(Val, ValB)
	end
end

SLib.fireclickdetectorwithbothmouseinputs = function(Val, ValAmount)
	if firesignal ~= nil and replicatesignal ~= nil then
		local ValACD = Val.MaxActivationDistance
		Val.MaxActivationDistance = math.huge

		firesignal(Val.MouseHoverEnter, SLib.LocalPlayer)
		replicatesignal(Val.MouseActionReplicated, SLib.LocalPlayer, 5)

		for Index = 1, tonumber(ValAmount) do 
			firesignal(Val.MouseClick, SLib.LocalPlayer)
			replicatesignal(Val.MouseActionReplicated, SLib.LocalPlayer, 5)
			firesignal(Val.RightMouseClick, SLib.LocalPlayer)
			replicatesignal(Val.MouseActionReplicated, SLib.LocalPlayer, 5)
		end

		firesignal(Val.MouseHoverLeave, SLib.LocalPlayer)
		replicatesignal(Val.MouseActionReplicated, SLib.LocalPlayer, 5)

		Val.MaxActivationDistance = ValACD
	end
end

SLib.CaptureService.CaptureBegan:Connect(function(GCaptureType)
	for Index, Val in pairs(GeneratedGUIs) do 
		Val.Enabled = false
		GeneratedGUIsET[Val] = Val.Enabled
	end
end) 

SLib.CaptureService.CaptureEnded:Connect(function(GCaptureType)
	for Index, Val in pairs(GeneratedGUIs) do 
		Val.Enabled = GeneratedGUIsET[Val]
	end
end) 

SLib.NGPlugin = function(GPluginN, GPlugin, GPluginConfig)
	if isfolder ~= nil and listfiles ~= nil then
		local GPluginPath = `SLib/GPlugins/`..GPluginN

		if isfolder(GPluginPath) and delfolder ~= nil then
			delfolder(GPluginPath)
		end

		makefolder(GPluginPath)
		writefile(GPluginPath..`/GPlugin.luau`, GPlugin)
		writefile(GPluginPath..`/GPluginConfig.json`, GPluginConfig)

		GPlugin = loadstring(GPlugin)()
		GPluginConfig = SLib.HttpService:JSONDecode(GPluginConfig)
		GPlugin = GPluginConfig.Callf and type(GPlugin) == `function` and GPlugin(SLib) or GPlugin

		SLib[GPluginN] = GPlugin
	end
end

SLib.GPluginExisCheck = function(GPluginN)
	return isfolder ~= nil and isfolder(`SLib/GPlugins/`..GPluginN)
end

SLib.GPluginsLF = function()
	if isfolder ~= nil and isfolder(`SLib/GPlugins`) and listfiles ~= nil then
		for Index, Val in pairs(listfiles(`SLib/GPlugins`)) do 
			local GPluginN = string.sub(Val, 15, -1)
			local GPlugin = loadstring(readfile(Val..`/GPlugin.luau`))()
			local GPluginConfig = SLib.HttpService:JSONDecode(readfile(Val..`/GPluginConfig.json`))
			GPlugin = GPluginConfig.Callf and type(GPlugin) == `function` and GPlugin(SLib) or GPlugin

			SLib[GPluginN] = GPlugin
		end
	end
end
  
SLib.GReadFile = function(GPath)	
	return isfile ~= nil and isfile(GPath) and readfile ~= nil and readfile(GPath) or nil
end
  
SLib.GJSONDecodeFile = function(GPath)	
	return isfile ~= nil and isfile(GPath) and readfile ~= nil and SLib.HttpService:JSONDecode(readfile(GPath)) or nil
end
 
SLib.GJSONEncodeFile = function(GPath)	
	return isfile ~= nil and isfile(GPath) and readfile ~= nil and SLib.HttpService:JSONEncode(readfile(GPath)) or nil
end

SLib.GSetGNotify = function(GFunc)
	SLib.GNotify = GFunc
end
  
SLib.AddSLibInGEnv = function()
	getgenv().SLib = SLib
end

SLib.Players.PlayerAdded:Connect(function(Player)
	table.insert(SLib.Roplayers, Player)

	for Index, Val in pairs(OnRoplayerJLFLT.OnRoplayerAdded) do 
		Val(Player)
	end
end) 

SLib.Players.PlayerRemoving:Connect(function(Player)
	SLib.Roplayers[Player] = nil

	for Index, Val in pairs(OnRoplayerJLFLT.OnRoplayerRemoving) do 
		Val(Player)
	end
end) 

for Index, Val in pairs(SLib.Players:GetPlayers()) do 
	table.insert(SLib.Roplayers, Val)
end

makefolder(`SLib/GPlugins`)

if not SLib.ManualGPlugins then
	SLib.GPluginsLF()
end

SLib.AddSLibInGEnv()

return SLib
