--
-- Informations
--
fx_version 'cerulean'
game 'gta5'

--
-- Author
--
author 'Tom Zidani <tom.zidani@gmail.com>'
description 'Vehicles Rental script with custom NUI & customizable options'
version '1.0'

--
-- Client
--
client_scripts {
    'config/*.lua',
    'client/*.lua',
}

--
-- Server
--
server_scripts {
    'server/*.lua'
}

--
-- Shared
--
shared_scripts {
    '@es_extended/imports.lua',
    'config/*.lua',
    'shared/*.lua',
}

--
-- NUI
--
ui_page 'nui/dist/index.html'

files {
    'nui/dist/index.html',
    'nui/dist/**/*',
}
