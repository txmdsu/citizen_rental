NPC = {}
NPC.__index = NPC

function NPC:new(modelHash, coords)
    local self = setmetatable({}, NPC)

    self.model = modelHash
    self.coords = coords
    self.ped = nil
    self.nui = NUI:new()

    return self
end

function NPC:init()
    self:loadModel()
end

function NPC:loadModel()
    RequestModel(self.model)
    while not HasModelLoaded(self.model) do
        Wait(500)
    end
end

function NPC:createNPC()
    if self.ped then return end

    local x, y, z = table.unpack(self.coords)
    local model = self.model

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(500)
    end

    self.ped = CreatePed(1, model, x, y, z, self.coords.w, false, false)
    SetEntityCoordsNoOffset(self.ped, x, y, z, true, true, true)
    local ground, zPos = GetGroundZFor_3dCoord(x, y, z, 0)
    SetEntityCoordsNoOffset(self.ped, x, y, zPos, true, true, true)

    self:handleNPC()
end

function NPC:handleNPC()
    Citizen.CreateThread(function()
        if not DoesEntityExist(self.ped) then return end

        self:handleNPCAttributes()
        self:handleNPCPlayerDistance()
    end)
end

function NPC:handleNPCPlayerDistance()
    while true do
        local pedCoords    = GetEntityCoords(self.ped)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance     = #(pedCoords - playerCoords)

        if distance < 15.0 then self:handleNPCMarker(pedCoords) end
        if distance < 1.0 then
            self:handleHelpTextDisplay()
            self:handleMenuDisplay()
        end

        Citizen.Wait(0)
    end
end

function NPC:handleNPCAttributes()
    TaskStandStill(self.ped, -1)
    SetEntityInvincible(self.ped, true)
    SetBlockingOfNonTemporaryEvents(self.ped, true)
    TaskStartScenarioInPlace(self.ped, "WORLD_HUMAN_CLIPBOARD", 0, true)

    Wait(1000)

    FreezeEntityPosition(self.ped, true)
end

function NPC:handleHelpTextDisplay()
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringPlayerName(Lang[Config.Locale].NPCHelpText)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function NPC:handleMenuDisplay()
    if IsControlJustReleased(0, 38) then
        self.nui:show()
    end
end

function NPC:handleNPCMarker(pedCoords)
    DrawMarker(20, pedCoords.x, pedCoords.y, pedCoords.z + 1.05, 0, 0, 0, 0, 0, 0, 0.25, 0.25, -0.25, 255, 255,
        255,
        100, false, true, 2, nil, nil, true)
end
