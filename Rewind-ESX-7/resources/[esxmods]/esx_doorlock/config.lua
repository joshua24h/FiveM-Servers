Config = {}
Config.Locale = 'en'

Config.CopsRequired       = 3

Config.PowerDownCoords ={
	x = 2832.532, y = 1538.749, z = 24.729
}


Config.DoorList = {

	--shitlord cell

	{
		objName = 'prop_ld_jail_door',
		objCoords  = {x = 186.696, y = -1000.62, z = 29.59597},
		textCoords = {x = 186.696, y = -1000.62, z = 29.59597},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},

    {
		objName = 'v_ilev_ph_cellgate',
		objCoords  = { x = 189.8678, y = -1001.732, z = 29.6016 },
		textCoords = { x = 189.8678, y = -1001.732, z = 29.6016 },
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},

    {
		objName = 'v_ilev_ph_cellgate',
		objCoords  = { x = 193.0072, y = -1002.881, z = 29.6016 },
		textCoords = { x = 193.0072, y = -1002.881, z = 29.6016 },
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},

    {
		objName = 'v_ilev_ph_cellgate',
		objCoords  = { x = 196.1718, y = -1004.039, z = 29.6016 },
		textCoords = { x = 196.1718, y = -1004.039, z = 29.6016 },
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},

-- pawn shop
--[[
	{
		objName = 'v_ilev_gc_door03',
		objCoords  = {x = 191.764, y = -1066.45, z = 29.399},
		textCoords = {x = 191.764, y = -1066.45, z = 29.399},
		authorizedJobs = { 'pawn' },
		locked = true,
		distance = 1.2
	},
]]
	{
		objName = 'v_ilev_cbankvaulgate02',
		objCoords  = { x = -400.3766, y = 1217.535, z = 329.7281},
		textCoords = { x = -400.3766, y = 1217.535, z = 329.7281},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},

	{
		objName = 'p_fin_vaultdoor_s',
		objCoords  = { x = -415.3321, y = 1223.531, z = 329.7625 },
		textCoords = { x = -415.3321, y = 1223.531, z = 329.7625 },
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.5
	},
	
	-- chopshop
	{
        objName = 'prop_com_gar_door_01',
        objCoords  = {x=-157.0565,y= -1292.284,z=32.34405},
        textCoords = {x=-156.9113,y= -1292.302,z=32.32952},
        authorizedJobs = { 'mecano' },
        locked = true,
        distance = 15,
        size = 1.7
    },


	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		objName = 'v_ilev_ph_door01',
		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
		textCoords = {x = 434.747, y = -981.50, z = 31.50},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_ph_door002',
		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
		textCoords = {x = 434.747, y = -982.50, z = 31.50},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 44.834},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.50, y = -986.00, z = 31.50},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 31.739},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},
	
	-- gate and doors
	
	{
		objName = 'prop_id2_11_gdoor',
		objCoords  = {x = 411.14, y = -1021.6, z = 30.69},
		textCoords = {x = 411.14, y = -1021.6, z = 30.69},
		authorizedJobs = { 'police' },
		distance = 10,
		size = 1.7
	},
	
	{
		objName = 'prop_bs_map_door_01',
		objCoords  = {x = 423.21, y = -998.2, z = 30.8},
		textCoords = {x = 423.21, y = -998.2, z = 30.8},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2
	},
		
	-- taco
	
	{
		objName = 'taco_drzwi',
		objCoords  = {x = 8.37, y = -1600.22, z = 29.77},
		textCoords = {x = 8.37, y = -1600.22, z = 29.77},
		authorizedJobs = { 'steves' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'taco_drzwi',
		objCoords  = {x = 19.79, y = -1598.57, z = 29.69},
		textCoords = {x = 19.79, y = -1598.57, z = 29.69},
		authorizedJobs = { 'steves' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'taco_drzwi',
		objCoords  = {x = 20.43, y = -1605.05, z = 29.83},
		textCoords = {x = 20.43, y = -1605.05, z = 29.83},
		authorizedJobs = { 'steves' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'taco_drzwi',
		objCoords  = {x = 12.57, y = -1605.88, z = 30.2},
		textCoords = {x = 12.57, y = -1605.88, z = 30.2},
		authorizedJobs = { 'steves' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},
	


	-- RIBJAIL
	-- START
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x=1222.352,y=3052.288,z=39.52278},
		textCoords = {x=1221.340,y=3055.270,z=42.52278},
		authorizedJobs = { 'police' },
		distance = 10,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x=1224.082,y=3045.098,z=39.52388}, 
		textCoords = {x=1223.070,y=3047.080,z=42.52388}, 
		authorizedJobs = { 'police' },
		distance = 10,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x=1146.088, y=3051.594, z=41.07444},
		textCoords = {x=1148.070, y=3051.5, z=45.07444},
		authorizedJobs = { 'police' },
		distance = 10,
		size = 1.7,
		locked = true,
	},
	
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x=1149.592, y=3073.87, z=41.27391},
		textCoords = {x=1152.0, y=3074.5, z=43.27391},
		authorizedJobs = { 'police' },
		distance = 10,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = { x=1165.687, y=3057.612, z=42.55623},
		textCoords = { x=1166.0, y=3056.5, z=42.55623},
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = { x=1183.349, y=3061.891, z=42.55415 },
		textCoords = { x=1183.0, y=3061.0, z=43.0 },
		authorizedJobs = { 'police' },
		distance = 1.5,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = { x=1195.469, y=3069.426, z=42.62091 },
		textCoords = { x=1195.0, y=3069.0, z=43.0 },
		authorizedJobs = { 'police' },
		distance = 1.5,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = { x=1210.748, y=3072.894, z=42.60246 },
		textCoords = { x=1210.5, y=3072.5, z=43.0 },
		authorizedJobs = { 'police' },
		distance = 1.6,
		size = 1.5,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1207.817, y=3079.63, z=42.63382 },
		textCoords = { x=1208.5, y=3080.5, z=43.0 },
		authorizedJobs = { 'police' },
		distance = 1.6,
		size = 1.5,
		locked = true,
	},

	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = { x=1204.869, y=3093.131, z=42.76378 },
		textCoords = { x=1204.975, y=3093.245, z=42.86378 },
		authorizedJobs = { 'police' },
		distance = 1.8,
		size = 1.6,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1197.582, y=3101.496, z=42.46888 },
		textCoords = { x=1197.582, y=3101.496, z=42.46888 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1192.598, y=3100.356, z=42.46289 },
		textCoords = { x=1192.598, y=3100.356, z=42.46289 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1187.418, y=3099.164, z=42.46282 },
		textCoords = { x=1187.418, y=3099.164, z=42.46282 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1182.19, y=3098.012, z=42.46272 },
		textCoords = { x=1182.19, y=3098.012, z=42.46272 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1176.905, y=3096.855, z=42.46261 },
		textCoords = { x=1176.905, y=3096.855, z=42.46261 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1171.763, y=3095.672, z=42.46254 },
		textCoords = { x=1171.763, y=3095.672, z=42.46254 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = { x=1168.105, y=3094.633, z=42.4995 },
		textCoords = { x=1168.105, y=3094.633, z=42.4995 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'v_ilev_cd_entrydoor',
		objCoords  = { x=1166.595, y=3111.018, z=42.41297 },
		textCoords = { x=1166.595, y=3111.018, z=42.41297 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1173.238, y=3112.491, z=42.45248 },
		textCoords = { x=1173.238, y=3112.491, z=42.45248 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1178.337, y=3113.649, z=42.42039 },
		textCoords = { x=1178.337, y=3113.649, z=42.42039 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1183.686, y=3114.754, z=42.4527 },
		textCoords = { x=1183.686, y=3114.754, z=42.4527 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1189.007, y=3115.96, z=42.45278 },
		textCoords = { x=1189.007, y=3115.96, z=42.45278 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1194.002, y=3117.053, z=42.45881 },
		textCoords = { x=1194.002, y=3117.053, z=42.45881 },
		authorizedJobs = { 'police' },
		distance = 1.4,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x=1202.369, y=3123.792, z=42.45598 },
		textCoords = { x=1202.369, y=3123.792, z=42.45598 },
		authorizedJobs = { 'police' },
		distance = 1.6,
		size = 1.7,
		locked = true,
	},

	{
		objName = 'prop_ld_jail_door',
		objCoords  = { x = 1195.342, y = 3123.787, z = 42.263 },
		textCoords = {x = 1195.342, y = 3123.787, z = 42.263 },
		authorizedJobs = { 'police' },
		distance = 1.9,
		size = 1.7,
		locked = true,
	},

	-- RIBJAIL
	-- END


	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.30, y = -992.686, z = 25.10},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.308, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.800, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1002.450, z = 25.064},
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.00, y = -1003.50, z = 25.50},
		authorizedJobs = { 'police' },
		locked = true
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.1362},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.136},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.894, y = -1020.210, z = 30.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = {x = 420.133, y = -1017.301, z = 28.086},
		textCoords = {x = 420.133, y = -1021.00, z = 32.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]

	{
		objName = 'slb2k11_SECDOOR',
		objCoords  = {x = 463.405, y = -1011.797, z = 32.98339},
		textCoords = {x = 463.405, y = -1011.797, z = 32.98339},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},
--	upstairs
	{
		objName = 'slb2k11_glassdoor',
		objCoords  = {x = 429.59, y = -994.581, z = 35.684},
		textCoords = {x = 429.59, y = -994.581, z = 35.684},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'slb2k11_glassdoor',
		objCoords  = {x = 429.64, y = -995.521, z = 35.684},
		textCoords = {x = 429.64, y = -995.521, z = 35.684},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{ 
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 450.1003, y = -992.956, z = 35.931},
		textCoords = {x = 450.1003, y = -992.956, z = 35.931},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},
--
	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 442.952, y = -993.737, z = 30.689},
		textCoords = {x = 442.952, y = -993.737, z = 30.689},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_ph_gendoor006',
		objCoords  = {x = 442.975, y = -992.613, z = 30.689},
		textCoords = {x = 442.975, y = -992.613, z = 30.689},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},
--
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 446.28, y = -998.981, z = 30.724},
		textCoords = {x = 446.28, y = -998.981, z = 30.724},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 445.305, y = -998.885, z = 30.725},
		textCoords = {x = 445.305, y = -998.885, z = 30.725},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.965, y = -996.711, z = 24.915},
		textCoords = {x = 467.965, y = -996.711, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 472.245, y = -996.573, z = 24.915},
		textCoords = {x = 472.245, y = -996.573, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.552, y = -996.697, z = 24.915},
		textCoords = {x = 476.552, y = -996.697, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 480.776, y = -996.534, z = 24.915},
		textCoords = {x = 480.776, y = -996.534, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.294, y = -1003.455, z = 24.915},
		textCoords = {x = 476.294, y = -1003.455, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.626, y = -1003.453, z = 24.915},
		textCoords = {x = 467.626, y = -1003.453, z = 24.915},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 1.1,
		size = 0.7
	},

	{
		objName = 'v_ilev_lostdoor',
		objCoords  = {x = 981.745, y = -102.808, z = 74.849},
		textCoords = {x = 981.745, y = -102.808, z = 74.849},
		authorizedJobs = { 'lazy' },
		locked = true,
		distance = 1.4,
		size = 0.5
	},
	
	-- omega club
	
	{
		objName = 'prop_grumandoor_l',
		objCoords  = {x = 163.8839, y = -981.2504, z = 30.44167},
		textCoords = {x = 163.8839, y = -981.2504, z = 30.44167},
		authorizedJobs = { 'mcdirty' },
		locked = true,
		distance = 1.2
	},

	{
		objName = 'prop_grumandoor_l',
		objCoords  = {x = 164.988, y = -982.857, z = 30.43645},
		textCoords = {x = 164.988, y = -982.857, z = 30.43645},
		authorizedJobs = { 'mcdirty' },
		locked = true,
		distance = 1.2
	},

	{
		objName = 'prop_grumandoor_l',
		objCoords  = {x = 175.3158, y = -975.4087, z = 30.59284},
		textCoords = {x = 175.3158, y = -975.4087, z = 30.59284},
		authorizedJobs = { 'mcdirty' },
		locked = true,
		distance = 1.2
	},

	{
		objName = 'prop_grumandoor_l',
		objCoords  = {x = 174.1957, y = -973.8052, z = 30.5979},
		textCoords = {x = 174.1957, y = -973.8052, z = 30.5979},
		authorizedJobs = { 'mcdirty' },
		locked = true,
		distance = 1.2
	},	
	-- bennys
	
	{
		objName = 'lr_prop_supermod_door_01',
		objCoords  = {x=-205.6828,y= -1310.683,z=30.29572},
		textCoords = {x=-205.6828,y= -1310.683,z=31.29572},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 15,
		size = 1.7
	},
	
	
	-- speedycabs

	{
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = 899.808, y = -162.443, z = 83.495},
		textCoords = {x = 899.808, y = -162.443, z = 83.495},
		authorizedJobs = { 'taxi' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},

	{
		objName = 'apa_p_mp_yacht_door_02',
		objCoords  = {x = 900.634, y = -162.817, z = 83.495},
		textCoords = {x = 900.634, y = -162.817, z = 83.495},
		authorizedJobs = { 'taxi' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},

	{
		objName = 'v_ilev_carmod3door',
		objCoords  = {x = -87.07264, y = -61.25505, z = 58.78257},
		textCoords = {x = -87.07264, y = -61.25505, z = 58.78257},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 8.5,
		size = 1.2
	},

	{
		objName = 'imp_prop_impexp_liftdoor_l',
		objCoords  = {x = -113.8419, y = -66.06946, z = 55.40662},
		textCoords = {x = -112.8419, y = -66.40059, z = 57.40662},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 4.5,
		size = 1.2
	},

	{
		objName = 'imp_prop_impexp_liftdoor_r',
		objCoords  = {x = -109.7181, y = -67.40059, z = 55.41156},
		textCoords = {x = -110.7181, y = -67.40059, z = 57.41156},
		authorizedJobs = { 'mecano' },
		locked = true,
		distance = 4.5,
		size = 1.2
	},
	
	
	-- mcdirty

	{
		objName = 'v_ilev_ra_door4l',
		objCoords  = {x = 1395.25, y = 1142.25, z = 114.89},
		textCoords = {x = 1395.25, y = 1142.25, z = 114.89},
		authorizedJobs = { 'mcdirty' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},
	
	{
		objName = 'v_ilev_ra_door4r',
		objCoords  = {x = 1394.85, y = 1141.64, z = 114.95},
		textCoords = {x = 1394.85, y = 1141.64, z = 114.95},
		authorizedJobs = { 'mcdirty' },
		locked = true,
		distance = 1.2,
		size = 1.0
	},
	
	-- tequila
	{
		objName = 'v_ilev_roc_door4',
		objCoords  = {x=-565.1712,y=276.6259,z=83.28626},
		textCoords = {x=-565.1712,y=276.6259,z=83.28626},
		authorizedJobs = { 'unemployed' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door1_l',
		objCoords  = {x=-561.3456, y=278.5798, z=83.12627},
		textCoords = {x=-561.3456, y=278.5798, z=83.12627},
		authorizedJobs = { 'unemployed' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door1_r',
		objCoords  = {x=-559.5514, y=278.4229, z=83.12627},
		textCoords = {x=-559.5514, y=278.4229, z=83.12627},
		authorizedJobs = { 'unemployed' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door5',
		objCoords  = {x=-567.9352, y=291.9264, z=85.52499},
		textCoords = {x=-567.9352, y=291.9264, z=85.52499},
		authorizedJobs = { 'unemployed' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'v_ilev_roc_door2',
		objCoords  = {x=-560.2373, y=293.0106, z=82.32609},
		textCoords = {x=-560.2373, y=293.0106, z=82.32609},
		authorizedJobs = { 'unemployed' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},
	
	-- lizard

	{
		objName = 'prop_id2_11_gdoor',
		objCoords  = { x=-1161.63 ,y=-1756.12 ,z=5.12},
		textCoords = { x=-1161.63 ,y=-1756.12 ,z=5.12},
		authorizedJobs = { 'lizard' },
		locked = true,
		distance = 3.5,
		size = 1.25
	},
	
	{
		objName = 'prop_ch1_07_door_01r',
		objCoords  = { x=-1175.302 ,y=-1756.35 ,z=4.16506},
		textCoords = { x = -1175.506, y = -1755.411, z = 3.95 },
		authorizedJobs = { 'lizard' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'prop_ch1_07_door_01l',
		objCoords  = { x=-1176.923 ,y=-1754.098 ,z=4.167774},
		textCoords = { x = -1176.347, y = -1754.882, z = 4.08},
		authorizedJobs = { 'lizard' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},

	{
		objName = 'prop_id2_11_gdoor',
		objCoords  = { x=-1179.093 ,y=-1751.031 ,z=4.041146},
		textCoords = { x = -1179.167, y = -1750.999, z = 4.043 },
		authorizedJobs = { 'lizard' },
		locked = true,
		distance = 1.5,
		size = 1.25
	},



	-- cardealer

	{
		objName = 'v_ilev_genbankdoor2',
		objCoords  = { x= -1163.75 ,y= -1715.634 ,z= 4.510905},
		textCoords = { x= -1163.75 ,y= -1715.634 ,z= 4.510905},
		authorizedJobs = { 'dealer' },
		locked = true,
		distance = 1.35,
		size = 1.25
	},

	{
		objName = 'v_ilev_genbankdoor1',
		objCoords  = { x = -1161.575 ,y = -1714.203 ,z = 4.510905},
		textCoords = { x = -1161.575 ,y = -1714.203 ,z = 4.510905},
		authorizedJobs = { 'dealer' },
		locked = true,
		distance = 1.35,
		size = 1.25
	},

	{
		objName = 'prop_id2_11_gdoor',
		objCoords  = { x = -1153.939 ,y = -1709.146 ,z = 5.469273},
		textCoords = { x = -1153.939 ,y = -1709.146 ,z = 5.469273},
		authorizedJobs = { 'dealer' },
		locked = true,
		distance = 10.0,
		size = 1.25
	},
}





