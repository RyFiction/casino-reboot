fx_version 'cerulean'
game 'gta5'

author '.Ry'
description 'Casino Script'
version '1.0.0'
lua54 'yes'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'qb-target',
    'qb-core',
    'qb-menu'
}



-- Server and client scripts
server_script 'tlpth.lua'
client_script 'teleport_to_penthouse.lua'
client_script 'teleport_to_lobby.lua'