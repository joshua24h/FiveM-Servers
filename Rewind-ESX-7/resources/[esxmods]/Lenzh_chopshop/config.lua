Config = {} -- DON'T TOUCH


Config.DrawDistance       = 100.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = false -- Set to false to disable blips.
Config.MarkerType         = -1    -- Change to -1 to disable marker.
Config.MarkerColor        = { r = 255, g = 0, b = 0 } -- Change the marker color.

Config.Locale             = 'en' -- Change the language. Currently available (en or fr).
Config.CooldownMinutes    = 0 -- Minutes between chopping.

Config.CallCops           = true -- Set to true if you want cops to be alerted when chopping is in progress
Config.CallCopsPercent    = 2 -- (min1) if 1 then cops will be called every time=100%, 2=50%, 3=33%, 4=25%, 5=20%.
Config.CopsRequired       = 0

Config.NPCEnable          = false -- Set to false to disable NPC Ped at shop location.
Config.NPCHash			      = 68070371 --Hash of the npc ped. Change only if you know what you are doing.
Config.NPCShop	          = { x = -146.818, y = -1283.854, z = 31.23, h = 88.805 } -- Location of the shop For the npc.

Config.GiveBlack          = false -- Wanna use Blackmoney?

-- Change the time it takes to open door then to break them.
-- Time in Seconde. 1000 = 1 seconde
Config.DoorOpenFrontLeftTime      = 5000
Config.DoorBrokenFrontLeftTime    = 5000
Config.DoorOpenFrontRightTime     = 5000
Config.DoorBrokenFrontRightTime   = 5000
Config.DoorOpenRearLeftTime       = 5000
Config.DoorBrokenRearLeftTime     = 5000
Config.DoorOpenRearRightTime      = 5000
Config.DoorBrokenRearRightTime    = 5000
Config.DoorOpenHoodTime           = 5000
Config.DoorBrokenHoodTime         = 5000
Config.DoorOpenTrunkTime          = 5000
Config.DoorBrokenTrunkTime        = 5000
Config.DeletingVehicleTime        = 5000

Config.Zones = {
    Chopshop = {coords = vector3(-148.766,-1290.332,31.254), name = _U('map_blip'), color = 49, sprite = 225, radius = 100.0, Pos = { x = -148.766,y = -1290.332, z = 31.254 }, Size  = { x = 1.2, y = 1.2, z = 1.0 }, },
    Shop = {coords = vector3(-146.818,-1283.854,31.23), name = _U('map_blip_shop'), color = 50, sprite = 120, radius = 100.0, Pos = {x = -146.818, y = -1283.854, z = 31.23}, Size  = { x = 1.2, y = 1.2, z = 1.0 }, },
}

Config.Items = {
    "battery",
    "lowradio",
    "stockrim",
    "airbag",
    "highradio",
    "highrim",
    "turbo"
}

Config.Itemsprice = {
    battery = 5,
    lowradio = 8,
    highradio = 10,
    stockrim = 15,
    highrim = 28,
    airbag = 12,
    turbo = 120
}
