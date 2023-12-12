Config = {}


--
-- Locale
--
Config.Locale                  = "en"

--
-- Marker
--
Config.MarkerLocation          = vector3(-1032.672485, -2735.314209, 20.164062)
Config.MarkerBlipIcon          = 326
Config.MarkerBlipScale         = 1.0
Config.MarkerBlipColor         = 0
Config.MarkerCustomText        = ""

--
-- NPC
--
Config.NPCModel                = 'a_m_m_prolhost_01'
Config.NPCPoint                = vector4(-1032.672485, -2735.314209, 20.164062, 85.039368)

--
-- Preview
--
Config.VehiclePreviewCamCoords = vector3(-1029.599976, -2732.136230, 20.079834)
Config.VehiclePreviewCamRot    = 90.708656

--
-- Vehicles
--
Config.VehicleSpawnPoint       = vector4(-1033.608765, -2730.936279, 19.658569, 240.944885)
Config.VehiclesRent            = {
    cars = {
        { name = 'Albany Primo',  model = 'primo',  price = 500 },
        { name = 'Declasse Asea', model = 'asea',   price = 550 },
        { name = 'Dinka Blista',  model = 'blista', price = 600 },
    },
    bikes = {
        { name = 'Pegassi Faggio',       model = 'faggio2', price = 200 },
        { name = 'Pegassi Faggio Sport', model = 'faggio',  price = 300 },
    }
}

return Config
