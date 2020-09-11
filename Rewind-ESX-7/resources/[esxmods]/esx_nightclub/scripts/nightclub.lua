Citizen.CreateThread(function()
    -- Getting the object to interact with
	Citizen.Wait(1000)
    AfterHoursNightclubs = exports['bob74_ipl']:GetAfterHoursNightclubsObject()
	Citizen.Wait(1000)

    -------------------------------------------
    -- Interior part


    -- Interior setup
    AfterHoursNightclubs.Ipl.Interior.Load()
    
    -- Setting the name of the club to The Palace
    AfterHoursNightclubs.Interior.Name.Set(AfterHoursNightclubs.Interior.Name.studio, true)

    -- Glamorous style
    AfterHoursNightclubs.Interior.Style.Set(AfterHoursNightclubs.Interior.Style.trad, true)

    -- Glam podiums
    AfterHoursNightclubs.Interior.Podium.Set(AfterHoursNightclubs.Interior.Podium.trad, true)

    -- speakers
    AfterHoursNightclubs.Interior.Speakers.Set(AfterHoursNightclubs.Interior.Speakers.upgrade, true)

    -- security
    AfterHoursNightclubs.Interior.Security.Set(AfterHoursNightclubs.Interior.Security.on, true)
    
    -- Setting turntables
    AfterHoursNightclubs.Interior.Turntables.Set(AfterHoursNightclubs.Interior.Turntables.style04, true)


    -- Ice -- 

    AfterHoursNightclubs.Interior.DryIce.Enable(true)

    -- Lights --
	
	AfterHoursNightclubs.Interior.Lights.Clear()
	
	--Laser--
	AfterHoursNightclubs.Interior.Lights.Lasers.Clear()
    AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.cyan, true)
    AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.yellow, true)
	AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.purple, true)
    AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.green, true)
    
    --[[
	--Bands--
	AfterHoursNightclubs.Interior.Lights.Bands.Clear()
	AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.white, true)
	AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.green, true)
    AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.yellow, true)
    ]]

   --Neons--
    AfterHoursNightclubs.Interior.Lights.Neons.Clear()
    AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.yellow, true)
	AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.purple, true)
	--Drops--
	AfterHoursNightclubs.Interior.Lights.Droplets.Clear()
	AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.purple, true)
	AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.yellow, true)

    -- Details
    AfterHoursNightclubs.Interior.Details.Enable(true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.truck, true, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.dryIce, true, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.clutter, false, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.worklamps, false, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.roofLightsOff, false, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.floorTradLights, true, true)
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.chest, true, true)
    
    -- Enabling bottles behind the bar
    AfterHoursNightclubs.Interior.Bar.Enable(true)

    -- Enabling all booze bottles
    AfterHoursNightclubs.Interior.Booze.Enable(AfterHoursNightclubs.Interior.Booze, true)

    -- Adding trophies on the desk
    AfterHoursNightclubs.Interior.Trophy.Enable(AfterHoursNightclubs.Interior.Trophy.dancer, true, AfterHoursNightclubs.Interior.Trophy.Color.gold)
    
    -- Refreshing interior to apply changes
    RefreshInterior(AfterHoursNightclubs.interiorId, true)


    -------------------------------------------
    -- Exterior IPL
    AfterHoursNightclubs.Mesa.Barrier.Enable(true)
    AfterHoursNightclubs.Mesa.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Mesa.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)
    
    AfterHoursNightclubs.MissionRow.Barrier.Enable(true)
    AfterHoursNightclubs.MissionRow.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.MissionRow.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Strawberry.Barrier.Enable(true)
    AfterHoursNightclubs.Strawberry.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Strawberry.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.VinewoodWest.Barrier.Enable(true)
    AfterHoursNightclubs.VinewoodWest.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.VinewoodWest.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Cypress.Barrier.Enable(true)
    AfterHoursNightclubs.Cypress.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Cypress.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.DelPerro.Barrier.Enable(true)
    AfterHoursNightclubs.DelPerro.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.DelPerro.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Airport.Barrier.Enable(true)
    AfterHoursNightclubs.Airport.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Airport.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Elysian.Barrier.Enable(true)
    AfterHoursNightclubs.Elysian.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Elysian.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)

    AfterHoursNightclubs.Vinewood.Barrier.Enable(true)
    AfterHoursNightclubs.Vinewood.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Vinewood.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)
    
    AfterHoursNightclubs.Vespucci.Barrier.Enable(true)
    AfterHoursNightclubs.Vespucci.Posters.Enable(AfterHoursNightclubs.Posters, true)
    AfterHoursNightclubs.Vespucci.Posters.Enable(AfterHoursNightclubs.Posters.forSale, false)
	
end)