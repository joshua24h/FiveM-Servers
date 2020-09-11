--XYZ
--1093.6, -3196.6, -38.99841
-- Coke IPL
Citizen.CreateThread(function()
    -- Getting the object to interact with
	Citizen.Wait(1000)
    BikerCocaine = exports['bob74_ipl']:GetBikerCocaineObject()
	Citizen.Wait(1000)

    -- Interior setup
    BikerCocaine.Ipl.Interior.Load()


    BikerCocaine.Style.Set(BikerCocaine.Style.upgrade, true)

    BikerCocaine.Security.Set(BikerCocaine.Security.upgrade, true)

    BikerCocaine.Details.Enable({BikerCocaine.Details.cokeUpgrade1, BikerCocaine.Details.cokeUpgrade2}, true)

    RefreshInterior(BikerCocaine.interiorId)
end)


--XYZ
--1051.491, -3196.536, -39.14842
-- Weed IPL

Citizen.CreateThread(function()
    -- Getting the object to interact with
	Citizen.Wait(1000)
    BikerWeedFarm = exports['bob74_ipl']:GetBikerWeedFarmObject()
	Citizen.Wait(1000)

    -- Interior setup
    BikerWeedFarm.Ipl.Interior.Load()


    BikerWeedFarm.Style.Set(BikerWeedFarm.Style.upgrade, true)

    BikerWeedFarm.Security.Set(BikerWeedFarm.Security.upgrade, true)

    BikerWeedFarm.Details.Enable(BikerWeedFarm.Details.drying, true)
    BikerWeedFarm.Details.Enable(BikerWeedFarm.Details.chairs, true)
    BikerWeedFarm.Details.Enable(BikerWeedFarm.Details.production, true)

    BikerWeedFarm.Plant1.Set(BikerWeedFarm.Plant1.Stage.medium, BikerWeedFarm.Plant1.Light.upgrade)
    BikerWeedFarm.Plant2.Set(BikerWeedFarm.Plant2.Stage.medium, BikerWeedFarm.Plant2.Light.upgrade)
    BikerWeedFarm.Plant3.Set(BikerWeedFarm.Plant3.Stage.medium, BikerWeedFarm.Plant3.Light.upgrade)
    BikerWeedFarm.Plant4.Set(BikerWeedFarm.Plant4.Stage.medium, BikerWeedFarm.Plant4.Light.upgrade)
    BikerWeedFarm.Plant5.Set(BikerWeedFarm.Plant5.Stage.medium, BikerWeedFarm.Plant5.Light.upgrade)
    BikerWeedFarm.Plant6.Set(BikerWeedFarm.Plant6.Stage.medium, BikerWeedFarm.Plant6.Light.upgrade)
    BikerWeedFarm.Plant7.Set(BikerWeedFarm.Plant7.Stage.full, BikerWeedFarm.Plant7.Light.upgrade)
    BikerWeedFarm.Plant8.Set(BikerWeedFarm.Plant8.Stage.full, BikerWeedFarm.Plant8.Light.upgrade)
    BikerWeedFarm.Plant9.Set(BikerWeedFarm.Plant9.Stage.full, BikerWeedFarm.Plant9.Light.upgrade)

    BikerWeedFarm.Plant1.Hose.Enable(true, true)
    BikerWeedFarm.Plant2.Hose.Enable(true, true)
    BikerWeedFarm.Plant3.Hose.Enable(true, true)
    BikerWeedFarm.Plant4.Hose.Enable(true, true)
    BikerWeedFarm.Plant5.Hose.Enable(true, true)
    BikerWeedFarm.Plant6.Hose.Enable(true, true)
    BikerWeedFarm.Plant7.Hose.Enable(true, true)
    BikerWeedFarm.Plant8.Hose.Enable(true, true)
    BikerWeedFarm.Plant9.Hose.Enable(true, true)

    RefreshInterior(BikerWeedFarm.interiorId)
end)

-- XYZ
-- 1121.897, -3195.338, -40.4025
-- Money wash IPL

Citizen.CreateThread(function()
    -- Getting the object to interact with
        BikerCounterfeit = exports['bob74_ipl']:GetBikerCounterfeitObject()

    -- Loading Ipls
        BikerCounterfeit.Ipl.Interior.Load()

    -- Setting the printers
        BikerCounterfeit.Printer.Set(BikerCounterfeit.Printer.upgradeProd)
    
    -- Setting the security
        BikerCounterfeit.Security.Set(BikerCounterfeit.Security.upgrade)

    -- Setting the dryers
        BikerCounterfeit.Dryer1.Set(BikerCounterfeit.Dryer1.open)
        BikerCounterfeit.Dryer2.Set(BikerCounterfeit.Dryer2.on)
        BikerCounterfeit.Dryer3.Set(BikerCounterfeit.Dryer3.on)
        BikerCounterfeit.Dryer4.Set(BikerCounterfeit.Dryer4.on)
        
    -- Enabling details
        BikerCounterfeit.Details.Enable(BikerCounterfeit.Details.chairs, true)
        BikerCounterfeit.Details.Enable(BikerCounterfeit.Details.furnitures, true)

    -- Refreshing the interior to the see the result
        RefreshInterior(BikerCounterfeit.interiorId)
end)