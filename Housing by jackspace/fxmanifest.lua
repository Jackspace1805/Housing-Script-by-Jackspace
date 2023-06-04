fx_version 'cerulean'
game 'gta5'

author 'Jackspace'
description 'Housing Script'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
}