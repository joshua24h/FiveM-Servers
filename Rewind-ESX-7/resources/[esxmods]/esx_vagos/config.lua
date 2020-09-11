Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.VagosStations = {

  Vagos = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 50000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 80000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 18000 },
      { name = 'WEAPON_STUNGUN',          price = 250 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { name = 'WEAPON_CARBINERIFLE',     price = 50000 },
      { name = 'WEAPON_ADVANCEDRIFLE',    price = 50000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 150000 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { name = 'WEAPON_APPISTOL',         price = 12000 },
      { name = 'WEAPON_FLARE',            price = 8000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  { name = 'WEAPON_POOLCUE',          price = 100 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'pony',  label = 'Pony' },
		  { name = 'burrito2',      label = 'Burrito' },
		  { name = 'dominator2',   label = 'Dominator' },
		  { name = 'boxville2',      label = 'boxville' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'maverick',       label = 'Helicopter' },
		  { name = 'cog55',       label = 'Executive' },
		  { name = 'mesa',       label = 'Tout-Terrain' },		  
	  },

    Cloakrooms = {
      { x = 361.96279907227, y = -2062.2780761719, z = 21.467725753784 },
    },

    Armories = {
      { x = 371.77291870117, y = -2055.8361816406, z = 21.744518280029 },
    },

    Vehicles = {
      {
        Spawner    = { x = 338.81692504883, y = -2042.8121337891, z = 21.291425704956 },
        SpawnPoint = { x = 332.33541870117, y = -2037.9342041016, z = 21.032257080078 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 328.31759643555, y = -2018.2722167969, z = 21.705713272095 },
        SpawnPoint = { x = 318.77709960938, y = -2027.2596435547, z = 20.674409866333 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 307.2712097168, y = -2024.1945800781, z = 20.36100769043 },
      { x = 309.17739868164, y = -2014.2563476563, z = 20.259113311768 },
    },

    BossActions = {
      { x = 335.68292236328, y = -2056.20703125, z = 20.825681686401 }
    },

  },

}
