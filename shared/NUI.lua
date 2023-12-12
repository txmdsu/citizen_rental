NUI = {}
NUI.__index = NUI

function NUI:new()
    local self = setmetatable({}, NUI)

    self.display = false
    self:init()
    self.activePreview = false

    return self
end

function NUI:init()
    self:handleCallbacks()
    self:handleDisplay()
end

function NUI:sendVehiclesList()
    SendNUIMessage({
        type = 'vehicles',
        vehicles = Config.VehiclesRent
    })
end

function NUI:handleCallbacks()
    RegisterNUICallback("exit", function()
        self:setDisplay(false)

        self:deletePreviewVehicle()
        Player:clearCamera()
    end)

    RegisterNUICallback("preview", function(data)
        local model = data.model

        NUI:previewVehicle(model)
    end)

    RegisterNUICallback("rent", function(data)
        local name = data.name
        local model = data.model
        local price = data.price

        Player:payRental(name, model, price)
    end)
end

function NUI:show()
    self:setDisplay(true)
end

function NUI:hide()
    self:setDisplay(false)
end

function NUI:setDisplay(bool)
    self.display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({ type = 'ui', status = bool })
    self:sendVehiclesList()
end

function NUI:handleDisplay()
    Citizen.CreateThread(function()
        while self.display do
            Citizen.Wait(0)
            DisableControlAction(0, 1, self.display)
            DisableControlAction(0, 2, self.display)
            DisableControlAction(0, 142, self.display)
            DisableControlAction(0, 18, self.display)
            DisableControlAction(0, 322, self.display)
            DisableControlAction(0, 106, self.display)
        end
    end)
end

function NUI:previewVehicle(model)
    if not model then
        DeleteVehicle(self.vehicle)
        self.vehicle = nil
    end

    local modelHash  = GetHashKey(model)
    local spawnPoint = Config.VehicleSpawnPoint

    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
        Citizen.Wait(0)
    end

    self:deletePreviewVehicle()

    self.vehicle = CreateVehicle(modelHash, spawnPoint.x, spawnPoint.y, spawnPoint.z, spawnPoint.w, false, false)

    SetEntityNoCollisionEntity(self.vehicle, GetPlayerPed(-1), false)
    NetworkSetEntityInvisibleToNetwork(self.vehicle, true)
    FreezeEntityPosition(self.vehicle, true)

    if (not self.activePreview) then
        Player:setPreviewCamCoords()
        self.activePreview = true
    end

    SetModelAsNoLongerNeeded(modelHash)
end

function NUI:deletePreviewVehicle()
    if self.vehicle then
        DeleteVehicle(self.vehicle)
        self.vehicle = nil
    end
end

return NUI
