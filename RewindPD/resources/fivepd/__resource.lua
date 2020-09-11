resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
description 'FivePD'

ui_page 'computer/index.html'
loadscreen "index.html"

files {
	'./index.html*',
	"Newtonsoft.Json.dll",
	'MenuAPI.dll',
    'Newtonsoft.Json.dll',
'./computer/*',
	'./computer/static/*',
	'./computer/static/css/*',
	'./computer/static/js/*',
	'./computer/static/media/*',
	'computer/public/*',
	'computer/public/icon/*',
	"Newtonsoft.Json.dll",
	'NativeUI.dll',
    	'Newtonsoft.Json.dll',
    	'callouts/*.dll',
    	'CalloutAPI.net.dll'
}

client_scripts {
	'FivePD_client.net.dll',
  'callouts/*.net.dll',
    'CalloutManager.net.dll'
}

server_scripts {
 'CalloutManagerServer.net.dll',
    'System.Net.dll',
	'TrafficStopServer.net.dll'
}
clr_disable_task_scheduler 'yes'