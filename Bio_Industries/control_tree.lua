
-- All tree Growing stuff

require ("stdlib/event/event")


local Bi_Industries = {}


Bi_Industries.fertility = {  -- out of 100, so 100 = always grow tree
	-- Vanilla
	["grass-1"] =  100,
	["grass-3"] =  85,
	["grass-2"] =  70,
	["grass-4"] =  60,
	["red-desert-0"] =  50,
	["dirt-3"] =  40,
	["dirt-5"] =  37,
	["dirt-6"] =  34,
	["dirt-7"] =  31,
	["dirt-4"] =  28,
	["dry-dirt"] =  25,
	["dirt-2"] =  22,
	["dirt-1"] =  19,
	["red-desert-2"] =  16,
	["red-desert-3"] =  13,
	["sand-3"] =  10,
	["sand-2"] =  7,
	["sand-1"] =  4,
	["red-desert-1"] =  1


		--[[ Needs updating once Bio Domes is updated
	-- Alien biomes
	["grass-red"]    = 65,
	["grass-orange"]    = 65,
	["grass-yellow"]    = 70,
	["grass-yellow-fade"]    = 65,
	["grass-blue-fade"]    = 55,
	["grass-blue"]    = 60,
	["grass-purple-fade"]    = 55,
	["grass-purple"]    = 60,
	["dirt-red"]    = 42,
	["dirt-brown"]    = 46,
	["dirt-tan"]    = 44,
	["dirt-dull"]    = 38,
	["dirt-grey"]    = 40,
	["dirt-red-dark"]    = 41,
	["dirt-brown-dark"]    = 45,
	["dirt-tan-dark"]    = 43,
	["dirt-dull-dark"]    = 37,
	["dirt-grey-dark"]    = 39,
	["sand-red"]    = 17,
	["sand-orange"]    = 21,
	["sand-gold"]    = 19,
	["sand-dull"]    = 13,
	["sand-grey"]    = 15,
	["sand-red-dark"]    = 16,
	["sand-orange-dark"]    = 20,
	["sand-gold-dark"]    = 18,
	["sand-dull-dark"]    = 12,
	["sand-grey-dark"]    = 14,
	["snow"]    = 2.5,
	["volcanic-cool"]    = 3,
	["volcanic-medium"]    = 2,
	["volcanic-hot"]    = 1
]]
}


--------------------

function seed_planted (event)
   -- Seed Planted
		local entity = event.created_entity
		local surface = entity.surface
		local position = entity.position	
		local fretility
		currentTilename = surface.get_tile(position.x, position.y).name
		if Bi_Industries.fertility[currentTilename] then
			fertility = Bi_Industries.fertility[currentTilename]				
		else
			fertility = 1 -- < Always a minimum of 1. 
		end
		
		local max_grow_time = math.random(5000) + 4040 - (40 * fertility) --< Fertile tiles will grow faster than barren tiles
		table.insert(global.bi.tree_growing, {position = event.created_entity.position, time = event.tick + max_grow_time, surface = surface})
		table.sort(global.bi.tree_growing, function(a, b) return a.time < b.time end)

end


function is_value_as_index_in_table (value, tabl) 
  for index, v in pairs (tabl) do
    if value == index then
      return true
    end
  end
  return false
end


terrains = require("libs/trees-and-terrains")

function summ_weight (tabl)
  local summ = 0
  for i, tree_weights in pairs (tabl) do
    if (type (tree_weights) == "table") and tree_weights.weight then
      summ = summ + tree_weights.weight
    end
  end
  return summ
end

function tree_from_max_index_tabl (max_index, tabl)
  local rnd_index = math.random (max_index)
  for tree_name, tree_weights in pairs (tabl) do
    if (type (tree_weights) == "table") and tree_weights.weight then
      rnd_index = rnd_index - tree_weights.weight
      if rnd_index <= 0 then
        return tree_name
      end
    end
  end
  return nil
end

function random_tree (surface, position)
  local tile = surface.get_tile(position.x, position.y)
  local tile_name = tile.name
  if is_value_as_index_in_table (tile_name, terrains) then
    local trees_table = terrains[tile_name]
    local max_index = summ_weight(trees_table)
    return tree_from_max_index_tabl (max_index, trees_table)
  end
end



local function Grow_tree(position, surface)
	
	local foundtree = false
	local tree = surface.find_entity("seedling", position)
	local currentTilename = surface.get_tile(position.x, position.y).name
	local fertility = 1 -- fertility will be 1 if terrain type not listed above, so very small change to grow.
	local growth_chance = math.random(100) -- Random value. Tree will grow if it's this value is smaller that the 'Fertility' value

				
	if tree then
		foundtree = true
		tree.destroy()
		
		--- Depending on Terain, choose tree type & Convert seedling into a tree
		
		
		if Bi_Industries.fertility[currentTilename] then
			fertility = Bi_Industries.fertility[currentTilename]
	

			local tree_name = random_tree (surface, position)
			if tree_name then
			  local can_be_placed = surface.can_place_entity{name=tree_name, position=position, force = "neutral"}
			  if can_be_placed and growth_chance <= fertility and foundtree then
				local tree = surface.create_entity{name=tree_name, position=position, force = "neutral"}
			  end
			end


			writeDebug("The current tile is: " .. currentTilename)
			writeDebug("The Growth Chance is: " .. growth_chance)
			writeDebug("The Fertility is: " .. fertility)
			writeDebug(treetype)



		
		---- Hardcode anything else to tree 9 for now.
		else
			treetype = "tree-09"
			
			writeDebug("Terrain or Fertility not found")
			writeDebug("The Growth Chance is: " .. growth_chance)
			writeDebug("The Fertility is: " .. fertility)
			if growth_chance <= fertility and foundtree and surface.can_place_entity({ name=treetype, position=position}) then
				surface.create_entity({ name=treetype, amount=1, position=position})
			end
				
		end		

	end
	
end



---- Growing Tree
Event.register(defines.events.on_tick, function(event)	

	while #global.bi.tree_growing > 0 do
		if event.tick < global.bi.tree_growing[1].time then
			break 
		end

		Grow_tree(global.bi.tree_growing[1].position, global.bi.tree_growing[1].surface)
		table.remove(global.bi.tree_growing, 1)
	end

end)






