fx_version 'adamant'
games { 'gta5' }

client_scripts {
  --JOB-- 
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/de.lua',
  'config.lua',
  'client/main.lua',
  
  'scripts/nightclub.lua',
  'scripts/screens.lua',
  'scripts/teleport.lua'
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/de.lua',
  'config.lua',
  'server/main.lua',
  'server/effects.lua'
}
