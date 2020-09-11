fx_version 'adamant'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

description 'FiveM FXServer speedometer'

version '1.1.0'

client_scripts {
	'config.lua',
	'client.lua',
	'skins/default.lua',
	'skins/default_middle.lua',
	'skins/id6.lua',
	'skins/id7.lua'
}

exports {
	'getAvailableSkins',
	'changeSkin',
	'addSkin',
	'toggleSpeedo',
	'getCurrentSkin',
	'addSkin',
	'toggleFuelGauge',
	'DoesSkinExist'
}

ui_page 'html/speedometer.html'

files {
	'html/speedometer.html',
	'html/sounds/initiald.ogg'
}