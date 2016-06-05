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
	