--##################################--
-- Create by Parchoquer
--##################################--

-- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING !
-- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING !
-- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING !

function SortedKeys(query, sortFunction)
    local keys, len = {}, 0
    for k,_ in pairs(query) do
        len = len + 1
        keys[len] = k
    end
    table.sort(keys, sortFunction)
    return keys
end

function CarsSpawner(vehicleName)
	local model = (type(vehicleName) == 'number' and vehicleName or GetHashKey(vehicleName))

	if IsModelInCdimage(model) then
		local playerPed = PlayerPedId()
		local playerCoords, playerHeading = GetEntityCoords(playerPed), GetEntityHeading(playerPed)

		if IsPedInAnyVehicle(playerPed, true) and deleteOld then
			local playerVeh = GetVehiclePedIsIn(playerPed, false)
			if DoesEntityExist(playerVeh) then
				SetEntityAsMissionEntity(playerVeh, false, true)
				DeleteVehicle(playerVeh)
			end
        end
        
        LoadModel(model)
		local vehicle = CreateVehicle(model, playerCoords.x, playerCoords.y, playerCoords.z, playerHeading, true, false)
        SetVehRadioStation(vehicle, 'OFF')
        TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    else
		Notify(language['invalidModel'])
	end
end

function LoadModel(modelHash)
	local modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))
	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)
		BeginTextCommandBusyspinnerOn('STRING')
		AddTextComponentSubstringPlayerName(language['loadCar'])
        EndTextCommandBusyspinnerOn(4)
        
        local i = 0
        while not HasModelLoaded(modelHash) and i < 600 do
			Citizen.Wait(1000)
            i = i + 1
		end
        BusyspinnerOff()
	end
end

function Notify(text)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(false, false)
end