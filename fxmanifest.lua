fx_version 'cerulean'
games { 'gta5' }

author 'Tizas'

description 'Searchas'

version '1.0.0'

lua54 'yes'


client_scripts {
    'game/client.lua'
}
server_script {
    'game/server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/**.lua',
}
