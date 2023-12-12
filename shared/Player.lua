Player = {}

function Player:SpawnInVehicle(modelName)
    NUI:deletePreviewVehicle()

    local modelHash = GetHashKey(modelName)
    local spawnPoint = Config.VehicleSpawnPoint

    local spawnedVehicle = GetClosestVehicle(spawnPoint.x, spawnPoint.y, spawnPoint.z, 3.0, 0, 70)
    if spawnedVehicle ~= 0 then
        local nodePos = GetEntityCoords(spawnedVehicle)
        local closestNode, nodeCoords = GetNthClosestVehicleNode(spawnPoint.x, spawnPoint.y, spawnPoint.z, 1, 1, 0)

        -- Extrait les coordonnées du vector4
        local x, y, z = table.unpack(nodeCoords)

        -- Change le point de spawn vers le nœud de route le plus proche
        spawnPoint = vector4(x, y, z, spawnPoint.w)
    end

    RequestModel(modelHash)

    while not HasModelLoaded(modelHash) do
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(modelHash, spawnPoint.x, spawnPoint.y, spawnPoint.z, spawnPoint.w, true, false)

    local playerPed = PlayerPedId()
    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(modelHash)
end

function Player:payRental(name, model, price)
    local playerId = GetPlayerServerId(PlayerId())

    TriggerServerEvent('citizen_rental:pay', playerId, name, model, price)
end

function Player:setPreviewCamCoords()
    self.cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    SetCamCoord(self.cam, Config.VehiclePreviewCamCoords)
    SetCamRot(self.cam, 0.0, 0.0, Config.VehiclePreviewCamRot)
    SetCamActive(self.cam, true)
    RenderScriptCams(true, true, 500, true, true)
end

function Player:clearCamera()
    if not self.cam then return end

    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(self.cam, true)

    self.cam = nil
    NUI.activePreview = false
end

return Player
