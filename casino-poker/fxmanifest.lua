shared_scripts { 
	'config.lua'
}

client_scripts {
    'locales/*.lua',
    'client/*.lua',
}

server_scripts {
    -- 'config.lua',
    'locales/*.lua',
    'server/sv_main.lua'
}


lua54 'yes'
game 'gta5'
fx_version 'adamant'
