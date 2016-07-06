-----------------------
--NE Functions--
-----------------------


function BI_Functions.Ingredient_Multiplier(Input, Multiplier)	
	if data.raw.recipe[Input] ~= nil then
		for _, recipe in pairs({Input}) do
			for _, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
				if ingredient[2] ~= nil then
					ingredient[2] = ingredient[2] * Multiplier
				elseif ingredient.amount ~= nil then
					ingredient.amount = ingredient.amount * Multiplier
				end   
			end
		end
	end
end	
	
	
-- Adds a resitance to an entity
function BI_Functions.Add_Damage_Resists(D_Type,Raw,Percent)
	if data.raw["damage-type"][D_Type] ~= nil then
		local Resist = {type = D_Type,percent = Percent}
		for i,d in pairs(Raw) do
			if d.resistances ==nil then d.resistances={} end
			table.insert(d.resistances, Resist)
		end
	end
end


---- Makes it that Biters don't attack rail. Side effect though is that rails don't show up on mini-map or blue-prints
function BI_Functions.Biters_Dont_Attack(Raw)
	for i,d in pairs(Raw) do
		local newflags = {}
		for pos=1,#d.flags do
			if not (d.flags[pos] == "player-creation") then
				table.insert(newflags, d.flags[pos])
			end
		end
		d.flags = newflags
	
	end
end


	