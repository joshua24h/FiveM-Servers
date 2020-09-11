Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    ["steam:1100001158FFDF5"] = 10, --Diesel Dave
	["steam:11000010623e568"] = 10, --Tards
	["steam:11000013323b893"] = 10, --Kate 
	["steam:110000108968cbd"] = 10, --RIB
	["steam:1100001376a1d04"] = 10, --KevKerber
	["steam:11000010b35a43f"] = 10, --kerbo
	["steam:11000010a7e0860"] = 10, --hotrock
	["steam:110000109378804"] = 10, --bike rider
	["steam:11000010e1f912d"] = 10, --HDgamer
	["steam:110000136597520"] = 10, --Worthingtonjamie
	["steam:1100001164ca420"] = 10, --british gamer
	["steam:11000010a9d745f"] = 10, --Stefen Power
	["steam:110000104ceecfc"] = 10, --Fubfreeman
	["steam:110000135069a37"] = 10, --Manliketom
	["steam:110000102d0f875"] = 10, --Blizzard
	["steam:1100001120041d3"] = 10, --Nattypants
	["steam:1100001037ffd42"] = 10, --kev lavis
	["steam:11000011b0e0bab"] = 10, --bean head
	["steam:11000010405124a"] = 10, --covboy
	["steam:110000105d03b27"] = 10, --lotima
	["steam:1100001157e226f"] = 10, --Jamie boal
	["steam:110000119234b56"] = 10, --Daveyboi
	["steam:110000105462fc5"] = 10, --Ruth
	["steam:11000011b1513bf"] = 10, --Francis
	["steam:11000013492d771"] = 10, --Ghost99
	["steam:1100001157A0DC7"] = 10, -- miguel
	["steam:110000106223308"] = 10, --Miner robin
	["steam:110000119de0033"] = 10, --Andy C
	["steam:1100001040fb9ca"] = 10, --Inzone
	["steam:110000102a0f7c4"] = 10, --boffey
	["steam:11000010abb71b1"] = 10, --smell blood
	["steam:1100001357103bb"] = 10, --lukefr
	["steam:11000011bf25c50"] = 10, --patrick
	["steam:11000011a4cb11f"] = 10, --white knight
	["steam:110000133911397"] = 10, --boffie
	["steam:11000011A32FB05"] = 10, --farmer olly
	["steam:1100001342FEBF3"] = 10, --wilsonj
	["steam:11000010E68B6FF"] = 10, --Silents
	["steam:11000010BB73548"] = 10, --girlgamer
	["steam:1100001372399EA"] = 10, --boro mike
	["steam:11000010C97A529"] = 10, --Firefight
	["steam:11000010304A648"] = 10, --ozdave
	["steam:110000107F9B288"] = 10, --bgsketch
	["steam:11000010AC17103"] = 10, --james tooey
	["steam:11000013643D85A"] = 10, --modz
	["steam:11000011313B749"] = 10, --scooby
	["steam:11000010667828F"] = 10, --dorian
	["steam:11000010B22E50B"] = 10, --lenny
	["steam:110000136762899"] = 10, --colby
	["steam:11000011863301F"] = 10, --brett
	["steam:11000011ABD308C"] = 10, --Nidge
	["steam:110000111829541"] = 10, --Mr legedn
	["steam:11000011291C806"] = 10, --riley pearce
	["steam:11000010DE41009"] = 10, --sam
	["steam:11000013C588B5B"] = 10, --Kevin Jones
	["steam:1100001154E8182"] = 10, --vapesquad
	["steam:110000104065264"] = 10, --dowler
	["steam:1100001095BB68B"] = 10, --vodka
	["steam:11000010604A0EF"] = 10, --Lazyboy
	["steam:110000104995E33"] = 10, --liam
	["steam:110000105D2D67E"] = 10, --spike
	["steam:110000117860587"] = 10, --john cooper
	["steam:11000010C1AF091"] = 10, --jay lock
	["steam:1100001164CA420"] = 10, --british gamer
	["steam:11000010C795C26"] = 10, --tiggy
	["steam:11000010FE0AE30"] = 10, --korbyn
	["steam:11000010A5DA13C"] = 10, --nick winters
	["steam:110000103133482"] = 10, --jason eckenstein
	["steam:110000110D9848E"] = 10, --ben gold
	["steam:11000010C9051D1"] = 10, --wayne
	["steam:110000109263511"] = 10, --woodyman
	["steam:11000013C9AE8B1"] = 10, --woody
	["steam:110000109039883"] = 10, --skullgamer
	["steam:11000010E67B928"] = 10, --jimmy marshall
	["steam:11000010A867EA8"] = 10, --felix connor
	["steam:110000136597520"] = 10, --Jamie worthington
	["steam:11000010A6D5B57"] = 10, --leon antrax
	["steam:110000106C2B8F1"] = 10, --David Connor
	["steam:11000011AA8E9D5"] = 10, --sean adams
	["steam:11000013CBB3C51"] = 10, --lewis everett
	["steam:11000010C637E3F"] = 10, --job trubble
	["steam:110000133596D9C"] = 10, --luke smith
	["steam:11000010DFDE512"] = 10, --stuart
	["steam:11000010EBD8A9F"] = 10, --mofassa
	["steam:110000113E324E5"] = 10, --kristian conaghan
	["steam:110000116EC473A"] = 10, --banksy
	["steam:1100001070C81D8"] = 10, --andy	
	["steam:11000010494813F"] = 10, --christopher	
	["steam:11000010687E31C"] = 10, --unrealzeus	
	["steam:110000102F934FF"] = 10, --predz	
	["steam:110000102D0F875"] = 10, --blizzard	
	["steam:110000119234B56"] = 10, --davey boy	
	["steam:11000013D7C5E45"] = 10, --mustafa
	["steam:11000013BE83DDB"] = 10, --gamewa
	["steam:110000112FFB69F"] = 10, --Luke allen
	["steam:110000131D80E0B"] = 10, --tom hill
	["steam:110000136B6AE5B"] = 10, --andrew
	["steam:11000010E79C1E5"] = 10, --mathew12
	["steam:1100001078A4521"] = 10, --jack pink
	["steam:11000011D65B912"] = 10, --antonia
	["steam:1100001375C7BEC"] = 10, --leeroy jenkins
	["steam:1100001048B91E1"] = 10, --bumper
	["steam:11000010A529FCE"] = 10, --mart langdon
	["steam:1100001141C9ABC"] = 10, --ford
	["steam:11000010C3767E3"] = 10, --power	
	["steam:11000010CE32F4F"] = 10, --oscar
	["steam:110000104C8FE02"] = 10, --dean
	["steam:110000111633BE2"] = 10, --amz
	["steam:110000107B441F1"] = 10, --Dave jefferies
	["steam:110000104C8FE02"] = 10, --Dean	grimm
	["steam:11000011783852D"] = 10, --jake

	["steam:11000010C5DE454"] = 10, --LATRICE DAVIES
	["steam:110000117a62655"] = 10, --lucifer
	["steam:110000109A0164B"] = 10, --korbyn
	["steam:11000010F111BE5"] = 10, --federick white

	["steam:110000108AB467A"] = 10, --brucie
	["steam:1100001083DA3DD"] = 10, --charlie p
	["steam:11000013D03300C"] = 10, --josh
	["steam:1100001178E370C"] = 10, --carlo gamino
	["steam:110000109A86206"] = 10, --oz bro
	["steam:110000136592537"] = 10, --jamie daly
	["steam:110000101CC337F"] = 10, --nick latta
	["steam:11000010AF502FA"] = 10, --ben davies
	["steam:110000113CB44E1"] = 10, --joshua fisher
	["steam:11000010DB6649E"] = 10, --stephen
	["steam:1100001320E752F"] = 10, --arunian
	["steam:1100001357103BB"] = 10, --john mcbird( LUKE FR)
	["steam:1100001001642CB"] = 10, --jason pearl
	["steam:11000010C17D8FB"] = 10, --adrian mcmaster
	["steam:11000013B11CB09"] = 10, -- jamie car dealer
	["steam:11000013F9DFAA0"] = 10, -- kraken
	["steam:1100001156297E9"] = 10, -- muckypup
	["steam:1100001144F621C"] = 10, -- muckypups other
	["steam:11000013CDF7B6C"] = 10, -- mr mango
	["steam:110000104CB7561"] = 10, -- certii
	["steam:1100001374B7C45"] = 10, -- noggy ( charlie norris)
	["steam:11000013F7540E9"] = 10, -- alfietoole39
	["steam:11000010397E966"] = 10, -- diesel daves bro
	["steam:11000010BE4DAEE"] = 10, -- diesel daves m8 johnny english
	["steam:110000111F2E004"] = 10, -- boyhazard
	["steam:1100001320F8C2B"] = 10, -- skorpio
	["steam:11000013E380894"] = 10, -- ben
	["steam:11000011B91BA33"] = 10, -- PUG - Kevin csgoice.com
	["steam:110000106458168"] = 10, -- autsn/carryv2
	["steam:110000132E69F50"] = 10, -- jaharris03uk
	["steam:110000135642135"] = 10, -- clibbo
	["steam:11000013BD0276A"] = 10, -- rmds-skeelsy
	["steam:1100001010E11E0"] = 10, -- tonic110	
	["steam:110000109455C59"] = 10, -- joey/joe blackburn
	["steam:110000115E57284"] = 10, -- matthew youn
	["steam:110000109611A4F"] = 10, -- jjw/Matrix0110
	["steam:110000110051CD4"] = 10, -- jack wolfington
	["steam:11000010D00B23A"] = 10, -- casparz jay
	["steam:11000010025841F"] = 10, -- laura Jenkins/chunkymunky19
	["steam:110000116E877F0"] = 10, -- boomer
	["steam:11000010741F767"] = 10, -- kevin moore / Geordie assassin
	["steam:110000100A9F31B"] = 10, -- calvin / captainwaffles
	
	["steam:11000011BDB7DC3"] = 10, -- jerzi brookman/jacko boi
	["steam:1100001331F974E"] = 10, -- Hayley / covgirlh
	["steam:1100001010A955B"] = 10, -- mark/jimmy
	["steam:1100001066E52C4"] = 10, -- ryker
	
	["steam:11000010399640C"] = 10, -- eric foote/nakkaplz
	["steam:110000104B131FD"] = 10, -- tyler/xavlios
	["steam:1100001184DB220"] = 10, -- josh turner / zachery insco
	
	["steam:110000135AEBD04"] = 10, -- parker / divineEKS
	["steam:1100001197AA66E"] = 10, -- kallum dyer / bob veloucci
	["steam:11000011D212468"] = 10, -- the irishgamer
	["steam:11000011C286A7D"] = 10, -- jason26 warner
	
	["steam:11000010C588981"] = 10, -- kiran edgecock
	
	["steam:11000010D845756"] = 10, --         harry carter / carter
	["steam:1100001000056BA"] = 10, --         rob shillam/rabscuttle
	["steam:110000102A28E2C"] = 10, --         demizle
	["steam:11000011428FEDE"] = 10, --         roger shayz / bmesa
	["steam:110000102E87987"] = 10, --         demon_nl
	
	["steam:1100001131A3742"] = 10, --         craig proctor
	["steam:110000107A0E699"] = 10, --         jax teller
	["steam:11000013D449778"] = 10, --         rod griffus
	["steam:11000013EEDD5C0"] = 10, --         joshua ryan
	["steam:11000013E65B97D"] = 10, --         solo
	["steam:1100001341FE207"] = 10, --         joe sniff
	["steam:11000013CA91D93"] = 10, --         sandy Watson
	["steam:1100001065D055F"] = 10, --         taran salyers
	["steam:110000131ECFB4D"] = 10, --         George harpe
	
	["steam:110000112A55EA3"] = 10, --         mr jingles
	["steam:11000013F5AFEEC"] = 10, --         Thomas
	["steam:11000010A268F96"] = 10, --         james
	["steam:11000010D41DF79"] = 10, --         joshua
	["steam:1100001149F7395"] = 10, --         eswaby
	["steam:1100001323623BD"] = 10, --			paul bennet
	
	["steam:11000010A611688"] = 10, -- robert elridge
	["steam:11000013E380894"] = 10, -- ben
	["steam:11000011792FAB7"] = 10, -- john kershaw
	["steam:1100001068F3C59"] = 10, -- gills
	["steam:1100001334C66E9"] = 10, -- jackoo
	["steam:110000117F7BEB2"] = 10, -- ackyboy/harry
	
	["steam:110000100C63608"] = 10, --ronald/krispy kreme
	["steam:11000013859E69F"] = 10, --elias/efrazitta
	["steam:110000133C405C1"] = 10, --beedi_ka_bundle / varun
	["steam:110000132B98C2E"] = 10, --martin peckover
	["steam:11000010C044E31"] = 10, --cam/divinity
	
	["steam:110000104DF7F05"] = 10, --sniffle / kris
	["steam:110000108917EA2"] = 10, --rab34
	["steam:1100001372941B1"] = 10, --gazza
	["steam:110000113DBAC2E"] = 10, --kieran goode
	["steam:110000113B44AAB"] = 10, --lamar / saucy_ meatball
	["steam:110000136063014"] = 10, --wegame
	["steam:1100001146DF01A"] = 10, --highc
	["steam:11000013C8BCCD8"] = 10, --pure acyion
	
	["steam:11000010C6CBC3C"] = 10, --farrahlee
	["steam:11000011D706BF6"] = 10, --xxpukka / jack taylor
	["steam:11000010C1D4B50"] = 10, --tuga / david ribeiro
	["steam:11000011313B749"] = 10, --pggreatbatch / scooby
	["steam:11000013EC32548"] = 10, --nathan
	
	["steam:1100001184C54B7"] = 10, --james keen
	["steam:11000010B8BCEB3"] = 10, --kev wasle
	["steam:11000013F367944"] = 10, --michael
	["steam:110000141380699"] = 10, --joshie
	["steam:11000010DB6649E"] = 10, --stephen
	["steam:1100001172C33C9"] = 10, --nahrin
	
	["steam:110000104DF7F05"] = 10, --sniffle
	["steam:1100001098B6A26"] = 10, --shaun / smcintyre
	["steam:1100001176FB3DB"] = 10, --micheal / elitepdw
	["steam:1100001000056BA"] = 10, --mac / rabscuttle
	
	
	["steam:110000105E3224F"] = 10, --thomas saunders / biggles2206
	["steam:11000010C908CAF"] = 10, --siggen
	["steam:11000010D2CFAE6"] = 10, --daniel
	
	["steam:11000010D0B2377"] = 10, --josh
	["steam:11000011D706BF6"] = 10, --jack taylor
	["steam:110000102F6DC83"] = 10, --darkbluefan
	
	["steam:11000013EB12E23"] = 10, -- tyler / ^1T Q P P R I M E
	["steam:1100001193DB975"] = 10, -- danny fryer / dannyfryer93
	["steam:11000011215EB6C"] = 10, --Ghostava Wesley / Sniperghost549
	["steam:11000010ADBFD7B"] = 10, --nolan
	["steam:110000119483DD6"] = 10, --Chris macgregor / Chrismacg87
	["steam:110000115029462"] = 10, --will watson / SMURF♛VEXEFON
	["steam:1100001351FDFFE"] = 10, --scott / scottcastle
	["steam:110000131F87DF6"] = 10, --ashley s / ashisthebest
	["steam:110000135D486AB"] = 10, --will / c38designs
	["steam:110000135D486AB"] = 10, --steven reilly/ Steven807196
	
	["steam:11000010A0604DA"] = 10, --andrew / [ERF] AndrewReid [UK]
	["steam:110000113B40B55"] = 10, --luke coleman
	
	["steam:110000105F64C51"] = 10, --Nihal Pandit / [2L-403] Echo
	["steam:1100001343F92E2"] = 10, --kyran / kizzaf91
	
	["steam:110000106B8D556"] = 10, -- ethan
	["steam:11000010406559D"] = 10, -- andre
	["steam:110000109DA7F5F"] = 10, -- staffir
	["steam:110000100C9D597"] = 10, -- randy
	["steam:1100001416E7FB4"] = 10, -- thomas
	["steam:11000013DFFC81D"] = 10, -- jen
	["steam:11000011869607B"] = 10, -- michael gang
	
	
	["steam:110000104E8BD39"] = 10, --steven gilbert / sonofkip	
	["steam:1100001140F9DD2"] = 10, --uros jankovic / pumba
	["steam:1100001341B66D6"] = 10, --cealan bedford	 
	
	["steam:110000109973242"] = 10, --jordan gaming
	
	["steam:11000013A58425A"] = 10, -- nick
	["steam:11000011BC786A8"] = 10, -- william68
	["steam:110000134603DC4"] = 10, -- enrick / sgt woody
	["steam:110000135FC6071"] = 10, -- noah
	["steam:110000105CFD457"] = 10, -- tony
	
	["steam:110000107AC9FEC"] = 10, -- klaus / bender
	["steam:11000010AF1C14F"] = 10, -- jamie / jimspancakes
	["steam:1100001193995D5"] = 10, -- connor
	
	["steam:11000010AC6A999"] = 10, -- markus
	["steam:11000011041313C"] = 10, -- leonardo / jaycapo
	["steam:11000013D26B358"] = 10, -- lee
	["steam:110000105F1FDD3"] = 10, -- cycore
	
	
	["steam:1100001358C68D8"] = 10, -- chris allen
	["steam:1100001030329DE"] = 10, -- dave / jazzyduster
	
	["steam:1100001173C7CAC"] = 10, -- kacper
	["steam:11000013DD7E44A"] = 10, -- jaimelee
	["steam:110000133C4C44F"] = 10, -- muhammed / RTx《NIŃJA》♕
	["steam:11000011C498BB3"] = 10, -- john / encrypt	
	["steam:1100001001B785F"] = 10, -- vipzer
	["steam:11000010AB6450B"] = 10, -- lewis	
	["steam:11000010C6D122C"] = 10, -- FRANK CASTLE
	["steam:11000013CF4CBC0"] = 10, -- treyten / james
	["steam:1100001333E1EFB"] = 10, -- joe exotic / christie
	["steam:11000013C31D3CD"] = 10, -- wyatt / james
	
	["steam:11000010675546A"] = 10, -- draatman
	["steam:110000111F2E004"] = 10, -- boyhazard
	["steam:11000010A6D63D4"] = 10, --  itselle
	["steam:11000010947AA4E"] = 10, --  bobby braxton
	
	
	["steam:1100001372F2ACC"] = 10, -- callum ford / cal fusion
	["steam:110000104F7D693"] = 10, --  sean451
	["steam:1100001072D19C1"] = 10, --  kev / kgp89
	["steam:1100001015AE3C8"] = 10, --  lee bailey / beatle
	
	["steam:1100001365AF758"] = 10, --  lexus / Onyx_LLW
	["steam:1100001363B3DDE"] = 10, --  callum dwyer / -cjd-
	["steam:11000013BE4F17A"] = 10, --  andrew / munch19941
	["steam:11000011D183BFF"] = 10, --  KCSJ2607
	
	["steam:11000011C998F25"] = 10, --  itselle (new)
	
	["steam:110000104E7C292"] = 10, --  andy
	["steam:11000013BF4C6DC"] = 10, --  sofia
	
	["steam:11000010822961B"] = 10, --  URDEMIZE304
	["steam:110000104034A6E"] = 10, --  RasAlGhulTheNF
	["steam:110000114B50715"] = 10, --  kuba
	
	["steam:110000103EED62D"] = 10, --  leon / lemoxis
	
	["steam:11000013EA8BB14"] = 10, --  justin
	["steam:110000113344065"] = 10, --  Vytautas
	["steam:1100001121129D5"] = 10, --  daniel smith
	["STEAM_0:0:45081027"] = 100, -- WaterfieldGaming
	
	["steam:11000013D0DA427"] = 10, -- lisa
	["steam:11000011324517B"] = 10, -- pablo
	["steam:110000115AC78C6"] = 10, -- bill
	["steam:11000013DD6F550"] = 10, -- ladarious
	["steam:11000011201A85C"] = 10, -- dang
	
	["steam:11000013E35E7D4"] = 10, -- jason
	["steam:110000104B131FD"] = 10, -- xavlios
	
	["steam:11000010709E3C9"] = 10, -- matthew fox
	["steam:11000010988F1D9"] = 10, -- steven
	["steam:11000013488D04A"] = 10, -- daniel
	["steam:11000011AA8E9D5"] = 10, -- St3althNight
	
	["steam:11000013D0E8B2C"] = 10, -- nguyen
	["steam:11000010EE4DB4B"] = 10, -- nicknew
	["steam:1100001125F3C91"] = 10, -- massey
	["steam:1100001078A4521"] = 10, -- jack rodr
	["steam:11000010EBF47CB"] = 10, -- samuel
	["steam:110000105DFECA8"] = 10, -- candit
	["steam:11000011BA0292D"] = 10, -- ketchup
	
	["steam:110000136AEF5D9"] = 10, -- kieran
	["steam:1100001419572FC"] = 10, -- blazed
	
	["steam:110000103861881"] = 10, -- rasmus
	 
} 


-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = true

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 600

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = true

-- how much priority power grace time will give
Config.GracePower = 10

-- how long grace time lasts in seconds
Config.GraceTime = 300

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 30000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Joining...",
    connecting = "\xE2\x8F\xB3Connecting...",
    idrr = "\xE2\x9D\x97[Queue] Error: Couldn't retrieve any of your id's, try restarting.",
    err = "\xE2\x9D\x97[Queue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou are %d/%d in queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Queue] Error: Error adding you to connecting list",
    timedout = "\xE2\x9D\x97[Queue] Error: Timed out?",
    wlonly = "\xE2\x9D\x97[Queue] You must be whitelisted to join this server",
    steam = "\xE2\x9D\x97 [Queue] Error: Steam must be running"
}