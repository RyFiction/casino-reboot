

fx_version 'adamant'
game 'gta5'
description 'Lucky Wheel'

author '.Ry'
version '1.0.1'
lua54 'yes'

server_script 'server.lua'

client_scripts {	
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
    'client.lua',
}

shared_script 'config.lua' 
