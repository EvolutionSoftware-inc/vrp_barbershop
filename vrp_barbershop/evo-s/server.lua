-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
--------------------------QUERY, AONDE A MAGIA ACONTECE.
vRP.prepare("vRP/updateSkinCharacter","UPDATE vrp_barbershop SET fathers = @fathers, kinship = @kinship, eyecolor = @eyecolor, skincolor = @skincolor, acne = @acne, stains = @stains, freckles = @freckles, aging = @aging, hair = @hair, haircolor = @haircolor, haircolor2 = @haircolor2, makeup = @makeup, makeupintensity = @makeupintensity, makeupcolor = @makeupcolor, lipstick = @lipstick, lipstickintensity = @lipstickintensity, lipstickcolor = @lipstickcolor, eyebrow = @eyebrow, eyebrowintensity = @eyebrowintensity, eyebrowcolor = @eyebrowcolor, beard = @beard, beardintentisy = @beardintentisy, beardcolor = @beardcolor, blush = @blush, blushintentisy = @blushintentisy, blushcolor = @blushcolor WHERE user_id=@user_id");
vRP.prepare("vRP/insertSkinCharacter","INSERT INTO vrp_barbershop (user_id, fathers, kinship, eyecolor, skincolor, acne, stains, freckles, aging, hair, haircolor,  haircolor2, makeup, makeupintensity, makeupcolor, lipstick, lipstickintensity, lipstickcolor, eyebrow, eyebrowintensity, eyebrowcolor, beard, beardintentisy, beardcolor,  blush, blushintentisy, blushcolor) VALUES (@user_id, @fathers, @kinship, @eyecolor, @skincolor, @acne,  @stains,  @freckles, @aging, @hair, @haircolor, @haircolor2, @makeup, @makeupintensity, @makeupcolor, @lipstick,  @lipstickintensity, @lipstickcolor, @eyebrow, @eyebrowintensity, @eyebrowcolor, @beard, @beardintentisy, @beardcolor, @blush, @blushintentisy, @blushcolor)");
vRP.prepare("vRP/selectSkin","SELECT * FROM vrp_barbershop WHERE user_id = @user_id")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_barbershop",cRP)
vCLIENT = Tunnel.getInterface("vrp_barbershop")
function cRP.getVRPBarberShop()
	local source = source
	local user_id = vRP.getUserId(source)
	local consult = vRP.query("vRP/selectSkin",{ user_id = parseInt(user_id) })
	if parseInt(#consult) > 0 then
		return 1
	else
		return 0
	end
end
function cRP.getClothes()
	local source = source
	local user_id = vRP.getUserId(source)
	local consult = vRP.query("vRP/selectSkin",{ user_id = parseInt(user_id) })
	if parseInt(#consult) > 0 then
		print(consult[1])

		return consult[1]
	else
		return 0
	end
end
------------------------
-- FIRST OPEN 
------------------

function cRP.insertFirstOpen()
	local source = source
	local user_id = vRP.getUserId(source)
	local myFirstConfig = json.decode(vRP.getUData(user_id,"currentCharacterMode"))
	vRP.execute("vRP/insertSkinCharacter",{user_id = parseInt(user_id), fathers = parseInt(myFirstConfig.mothersID),  kinship = myFirstConfig.fathersID, eyecolor = parseInt(myFirstConfig.eyebrowsColor), skincolor = parseInt(myFirstConfig.skinColor), acne = parseInt(myFirstConfig.sundamageModel), stains = parseInt(myFirstConfig.sundamageModel), freckles = parseInt(myFirstConfig.frecklesModel), aging = parseInt(myFirstConfig.ageingModel), hair = parseInt(myFirstConfig.hairModel), haircolor = parseInt(myFirstConfig.firstHairColor), haircolor2 = parseInt(myFirstConfig.secondHairColor), makeup = parseInt(myFirstConfig.makeupModel), makeupintensity = parseInt(0), makeupcolor = parseInt(0), lipstick = parseInt(myFirstConfig.lipstickModel), lipstickintensity = parseInt(0), lipstickcolor = parseInt(myFirstConfig.lipstickColor), eyebrow = parseInt(myFirstConfig.eyebrowsModel), eyebrowintensity = parseInt(myFirstConfig.eyebrowsWidth), eyebrowcolor = parseInt(0), beard = parseInt(myFirstConfig.beardModel), beardintentisy = parseInt(0), beardcolor = parseInt(myFirstConfig.beardColor), blush = parseInt(myFirstConfig.blushModel), blushintentisy = parseInt(0), blushcolor = parseInt(myFirstConfig.blushColor) })	
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateSkin(myClothes)
	local source = source
	local user_id = vRP.getUserId(source)
	
	if user_id then
	local consult = cRP.getVRPBarberShop(parseInt(user_id))
	if parseInt(consult) > 0 then
		vRP.execute("vRP/updateSkinCharacter",{user_id = parseInt(user_id), fathers = parseInt(myClothes[1]),  kinship = parseInt(myClothes[2]), eyecolor = parseInt(myClothes[3]), skincolor = parseInt(myClothes[4]), acne = parseInt(myClothes[5]), stains = parseInt(myClothes[6]), freckles = parseInt(myClothes[7]), aging = parseInt(myClothes[8]), hair = parseInt(myClothes[9]), haircolor = parseInt(myClothes[10]), haircolor2 = parseInt(myClothes[11]), makeup = parseInt(myClothes[12]), makeupintensity = parseInt(myClothes[13]), makeupcolor = parseInt(myClothes[14]), lipstick = parseInt(myClothes[15]), lipstickintensity = parseInt(myClothes[16]), lipstickcolor = parseInt(myClothes[17]), eyebrow = parseInt(myClothes[18]), eyebrowintensity = parseInt(myClothes[19]), eyebrowcolor = parseInt(myClothes[20]), beard = parseInt(myClothes[21]), beardintentisy = parseInt(myClothes[22]), beardcolor = parseInt(myClothes[23]), blush = parseInt(myClothes[24]), blushintentisy = parseInt(myClothes[25]), blushcolor = parseInt(myClothes[26]) })
	else
		end
		
		end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYCUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.tryCustomization(index,status)
	vCLIENT.syncCustomization(-1,index,status)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local consult = vRP.query("vRP/selectSkin",{ user_id = parseInt(user_id) })
		if parseInt(#consult) > 0 then
			Citizen.Wait(5000)
			vCLIENT.setCustomization(source,{ parseInt(consult[1].fathers),parseInt(consult[1].kinship),parseInt(consult[1].eyecolor),parseInt(consult[1].skincolor),parseInt(consult[1].acne),parseInt(consult[1].stains),parseInt(consult[1].freckles),parseInt(consult[1].aging),parseInt(consult[1].hair),parseInt(consult[1].haircolor),parseInt(consult[1].haircolor2),parseInt(consult[1].makeup),parseInt(consult[1].makeupintensity),parseInt(consult[1].makeupcolor),parseInt(consult[1].lipstick),parseInt(consult[1].lipstickintensity),parseInt(consult[1].lipstickcolor),parseInt(consult[1].eyebrow),parseInt(consult[1].eyebrowintensity),parseInt(consult[1].eyebrowcolor),parseInt(consult[1].beard),parseInt(consult[1].beardintentisy),parseInt(consult[1].beardcolor),parseInt(consult[1].blush),parseInt(consult[1].blushintentisy),parseInt(consult[1].blushcolor) })
		else
		end
	end
end)