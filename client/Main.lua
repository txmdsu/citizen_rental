local firstSpawn = true

Main = {}

function Main:new()
    self.__index = self
    local obj = {}
    setmetatable(obj, self)

    obj:loadNPC()
    obj:addMapMarker()

    return obj
end

function Main:loadNPC()
    local npcCoords = Config.NPCPoint
    local npcModel = GetHashKey(Config.NPCModel)

    self.npc = NPC:new(npcModel, npcCoords)
    self.npc:loadModel()
    self.npc:createNPC()
end

function Main:addMapMarker()
    Citizen.CreateThread(function()
        local blip = AddBlipForCoord(Config.MarkerLocation)

        SetBlipSprite(blip, Config.MarkerBlipIcon)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, Config.MarkerBlipScale)

        SetBlipColour(blip, Config.MarkerBlipColor)

        SetBlipAsShortRange(blip, true)

        local haveCustomText = Config.MarkerCustomText and Config.MarkerCustomText ~= ""
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(haveCustomText and Config.MarkerCustomText or Lang[Config.Locale].MarkerText)
        EndTextCommandSetBlipName(blip)
    end)
end

RegisterNetEvent('citizen_rental:paymentSuccessful')
AddEventHandler('citizen_rental:paymentSuccessful', function(model)
    Player:SpawnInVehicle(model)
    NUI:setDisplay(false)
    Player:clearCamera()
end)

AddEventHandler('playerSpawned', function()
    if firstSpawn then
        Citizen.CreateThread(function()
            local m = Main:new()

            firstSpawn = false
        end)
    end
end)
