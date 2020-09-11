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

Config.BallasStations = {

  Ballas = {

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
      { x = 86.296157836914, y = -1956.453125, z = 20.749540328979 },
    },

    Armories = {
      { x = 74.690231323242, y = -1973.130859375, z = 20.836135864258 },
    },

    Vehicles = {
      {
        Spawner    = { x = 85.752388000488, y = -1970.1140136719, z = 20.747457504272 },
        SpawnPoint = { x = 91.324272155762, y = -1963.1926269531, z = 20.747457504272 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 102.56782531738, y = -1955.6950683594, z = 20.751256942749 },
        SpawnPoint = { x = 102.03726196289, y = -1945.3172607422, z = 20.803823471069 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 97.913734436035, y = -1959.2733154297, z = 20.747886657715 },
      { x = 96.237586975098, y = -1955.3172607422, z = 20.748369216919 },
    },

    BossActions = {
      { x = 79.592903137207, y = -1955.2723388672, z = 20.769792556763 }
    },

  },

}
