--##################################--
-- Create by Parchoquer
-- Version: 1.0
--##################################--

-- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING !
-- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING !
-- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING !

local mainCars = RageUI.CreateMenu(nil, config.subtitle, nil, nil, "common", config.banner)
local subCars = RageUI.CreateSubMenu(mainCars, nil, nil)
local menuShowed = false
local cooldown = false
local list = nil
deleteOld = true
language = config.languages[config.lang]

mainCars.Closed = function() menuShowed = false end

Citizen.CreateThread(function()
    while (true) do
        
        if IsControlJustPressed(1, config.openMenu) and IsInputDisabled(0) then
            menuShowed = true
            RageUI.Visible(mainCars, not RageUI.Visible(mainCars))
        end
        
        RageUI.IsVisible(mainCars, true, false, true, function()
            RageUI.Checkbox(language['deleteOldCar'], nil, deleteOld, {}, function(_, _, _, Checked)
                deleteOld = Checked
            end)

            for _, k in pairs(SortedKeys(config.cars)) do
                RageUI.ButtonWithStyle(k, nil, { RightLabel = "~b~→" }, true, function(_, _, Selected)
                    if (Selected) then
                        list = config.cars[k]
                    end
                end, subCars)
            end
        end)
        
        RageUI.IsVisible(subCars, true, false, true, function()
            for _, v in pairs(list) do
                RageUI.ButtonWithStyle(v.name, nil, {}, not cooldown, function(_, _, Selected)
                    if (Selected) then
                        cooldown = true
                        Citizen.SetTimeout(config.cooldown, function()
                            cooldown = false
                        end)
                        CarsSpawner(v.model)
                    end
                end)
            end
        end)
        Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
	while (true) do
		Citizen.Wait(0)
        if menuShowed then
            -- controller compatibility
			DisableControlAction(2, 85, true) -- RADIO_WHEEL DPAD LEFT
			DisableControlAction(2, 74, true) -- HEADLIGHT DPAD RIGHT
			DisableControlAction(2, 20, true) -- MULTIPLAYER_INFO DPAD DOWN
			DisableControlAction(2, 303, true) -- LOCKCAR DPAD UP
            DisableControlAction(2, 80, true) -- INPUT_VEH_CIN_CAM B or O (controller)
            DisableControlAction(2, 140, true) -- MELEE_ATTACK_LIGHT B or O (controller)
		else
			Citizen.Wait(500)
		end
	end
end)
