-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_barbershop",cRP)
vSERVER = Tunnel.getInterface("vrp_barbershop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = -1
local myClothes = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkin",function(data)
	myClothes = {}
	myClothes = { tonumber(data.fathers), tonumber(data.kinship), tonumber(data.eyecolor), tonumber(data.skincolor), tonumber(data.acne), tonumber(data.stains), tonumber(data.freckles), tonumber(data.aging), tonumber(data.hair), tonumber(data.haircolor), tonumber(data.haircolor2), tonumber(data.makeup), tonumber(data.makeupintensity), tonumber(data.makeupcolor), tonumber(data.lipstick), tonumber(data.lipstickintensity), tonumber(data.lipstickcolor), tonumber(data.eyebrow), tonumber(data.eyebrowintensity), tonumber(data.eyebrowcolor), tonumber(data.beard), tonumber(data.beardintentisy), tonumber(data.beardcolor), tonumber(data.blush), tonumber(data.blushintentisy), tonumber(data.blushcolor) }

	if data.value then
		SetNuiFocus(false)
		displayBarbershop(false, false ,false)
		vSERVER.updateSkin(myClothes)
		SendNUIMessage({ openBarbershop = false })
	end

	cRP.setCustomization(myClothes)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATELEFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotate",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "left" then
		SetEntityHeading(ped,heading+10)
	elseif data == "right" then
		SetEntityHeading(ped,heading-10)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.setCustomization(status)
	myClothes = {}
	myClothes = { status[1], status[2], status[3], status[4], status[5], status[6], status[7], status[8], status[9], status[10], status[11], status[12], status[13], status[14], status[15], status[16], status[17], status[18], status[19], status[20], status[21], status[22], status[23], status[24], status[25], status[26] }

	vSERVER.tryCustomization(PedToNet(PlayerPedId()),myClothes)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCUSTOMEVOLUTION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.syncCustomization(index,status)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToEnt(index)
		if DoesEntityExist(v) then
			SetPedHeadBlendData(v,status[1],0,status[1],status[4],status[4],status[4],status[2]*0.1,status[2]*0.1,1.0,true)
			SetPedEyeColor(v,status[3])

			if status[5] == 0 then
				SetPedHeadOverlay(v,0,status[5],0.0)
			else
				SetPedHeadOverlay(v,0,status[5],1.0)
			end

			SetPedHeadOverlay(v,6,status[6],1.0)

			if status[7] == 0 then
				SetPedHeadOverlay(v,9,status[7],0.0)
			else
				SetPedHeadOverlay(v,9,status[7],1.0)
			end

			SetPedHeadOverlay(v,3,status[8],1.0)

			SetPedComponentVariation(v,2,status[9],0,2)
			SetPedHairColor(v,status[10],status[11])

			SetPedHeadOverlay(v,4,status[12],status[13]*0.1)
			SetPedHeadOverlayColor(v,4,1,status[14],status[14])

			SetPedHeadOverlay(v,8,status[15],status[16]*0.1)
			SetPedHeadOverlayColor(v,8,1,status[17],status[17])

			SetPedHeadOverlay(v,2,status[18],status[19]*0.1)
			SetPedHeadOverlayColor(v,2,1,status[20],status[20])

			SetPedHeadOverlay(v,1,status[21],status[22]*0.1)
			SetPedHeadOverlayColor(v,1,1,status[23],status[23])

			SetPedHeadOverlay(v,5,status[24],status[25]*0.1)
			SetPedHeadOverlayColor(v,5,1,status[26],status[26])
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPLAY
-----------------------------------------------------------------------------------------------------------------------------------------
function displayBarbershop(enable, firstOpen, newClothes)
	local ped = PlayerPedId()

	if enable then
		SetNuiFocus(true,true)
		if firstOpen then
			SendNUIMessage({ openBarbershop = true, fathers = newClothes.fathers, kinship = newClothes.kinship, eyecolor = newClothes.eyecolor, skincolor = newClothes.skincolor, acne = newClothes.acne, stains = newClothes.stains, freckles = newClothes.freckles, aging = newClothes.aging, hair = newClothes.hair, haircolor = newClothes.haircolor, haircolor2 = newClothes.haircolor2, makeup = newClothes.makeup, makeupintensity = newClothes.makeupintensity, makeupcolor = newClothes.makeupcolor, lipstick = newClothes.lipstick, lipstickintensity = newClothes.lipstickintensity, lipstickcolor = newClothes.lipstickcolor, eyebrow = newClothes.eyebrow, eyebrowintensity = newClothes.eyebrowintensity, eyebrowcolor = newClothes.eyebrowcolor, beard = newClothes.beard, beardintentisy = newClothes.beardintentisy, beardcolor = newClothes.beardcolor, blush = newClothes.blush, blushintentisy = newClothes.blushintentisy, blushcolor = newClothes.blushcolor })
		else
			SendNUIMessage({ openBarbershop = true, fathers = myClothes[1], kinship = myClothes[2], eyecolor = myClothes[3], skincolor = myClothes[4], acne = myClothes[5], stains = myClothes[6], freckles = myClothes[7], aging = myClothes[8], hair = myClothes[9], haircolor = myClothes[10], haircolor2 = myClothes[11], makeup = myClothes[12], makeupintensity = myClothes[13], makeupcolor = myClothes[14], lipstick = myClothes[15], lipstickintensity = myClothes[16], lipstickcolor = myClothes[17], eyebrow = myClothes[18], eyebrowintensity = myClothes[19], eyebrowcolor = myClothes[20], beard = myClothes[21], beardintentisy = myClothes[22], beardcolor = myClothes[23], blush = myClothes[24], blushintentisy = myClothes[25], blushcolor = myClothes[26] })
		end
		FreezeEntityPosition(ped,true)
		DisableControlAction(2,14,true)
		DisableControlAction(2,15,true)
		DisableControlAction(2,16,true)
		DisableControlAction(2,17,true)
		DisableControlAction(2,30,true)
		DisableControlAction(2,31,true)
		DisableControlAction(2,32,true)
		DisableControlAction(2,33,true)
		DisableControlAction(2,34,true)
		DisableControlAction(2,35,true)
		DisableControlAction(0,25,true)
		DisableControlAction(0,24,true)

		if IsDisabledControlJustReleased(0,24) or IsDisabledControlJustReleased(0,142) then
			SendNUIMessage({ type = "click" })
		end

		SetPlayerInvincible(ped,true)

		if not DoesCamExist(cam) then
			cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
			SetCamCoord(cam,GetEntityCoords(ped))
			SetCamRot(cam,0.0,0.0,0.0)
			SetCamActive(cam,true)
			RenderScriptCams(true,false,0,true,true)
			SetCamCoord(cam,GetEntityCoords(ped))
		end

		local x,y,z = table.unpack(GetEntityCoords(ped))
		SetCamCoord(cam,x+0.2,y+0.5,z+0.7)
		SetCamRot(cam,0.0,0.0,150.0)
	else
		FreezeEntityPosition(ped,false)
		SetPlayerInvincible(ped,false)
		RenderScriptCams(false,false,0,1,0)
		DestroyCam(cam,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false)
	SendNUIMessage({ openBarbershop = false })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCAIS
-----------------------------------------------------------------------------------------------------------------------------------------
local locations = {
	{ -813.37,-183.85,37.57 },
	{ 138.13,-1706.46,29.3 },
	{ -1280.92,-1117.07,7.0 },
	{ 1930.54,3732.06,32.85 },
	{ 1214.2,-473.18,66.21 },
	{ -33.61,-154.52,57.08 },
	{ -276.65,6226.76,31.7 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("barber",function(source,args)
	local ped = PlayerPedId()
	local verifyExistConfig = vSERVER.getVRPBarberShop()
	local execute = 0
	if parseInt(verifyExistConfig) == 0 then
		vSERVER.insertFirstOpen()
	end
	local myClothes = vSERVER.getClothes()
	print(myClothes.fathers)
	
	local x,y,z = table.unpack(GetEntityCoords(ped))

	for k,v in pairs(locations) do
		local distance = GetDistanceBetweenCoords(x,y,z,v[1],v[2],v[3],true)
		if distance <= 5 then
			displayBarbershop(true, true, myClothes)
			SetEntityHeading(ped,332.21)
		end
	end
end)