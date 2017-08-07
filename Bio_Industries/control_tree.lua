
-- All tree Growing stuff

require ("stdlib/event/event")

local Bi_Industries = {}


Bi_Industries.fertility = {  -- out of 100, so 100 = always
	-- Vanilla
	["grass-medium"]    = 100,
	["grass"]    = 85,
	["grass-dry"]    = 65,
	["dirt"]    = 47,
	["dirt-dark"]    = 36,
	["sand"]    = 22,
	["sand-dark"]    = 11,
	["red-desert"]    = 5,
	["red-desert-dark"]    = 2.5,
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
			fertility = 0
		end
		
		local max_grow_time = math.random(5000) + 4000 - (40 * fertility)
		table.insert(global.bi.tree_growing, {position = event.created_entity.position, time = event.tick + max_grow_time, surface = surface})
		table.sort(global.bi.tree_growing, function(a, b) return a.time < b.time end)

end


local function get_random_from_table (table)
   -- compressed table if some elements was deleted and we have {[1] = value1, [3] = value3}
   local compressed_table = {}
   for i, value in pairs (table) do
      if value then 
         compressed_table[#compressed_table+1] = value
      end
   end
   return compressed_table[math.random(1,#compressed_table)]
end



local function get_random_tree_for_terrain (terrain_name) -- text
  
   local terrains = {}
   --Vanilla
	terrains["grass-medium"] = 
	{
	  name = "grass-medium",
	  trees = {
	   "tree-02",   
	   "tree-03",
	   "tree-04",
	   "tree-05"
	  }
	}
	terrains["grass"] = {
	  name = "grass",
	  trees = {
		"tree-01",
		"tree-02",
		"tree-03",
		"tree-04",
		"tree-05",
		"tree-07",
		"tree-08"
	  }
	}
	terrains["grass-dry"] = {
	  name = "grass-dry",
	  trees = {     
		"tree-01",
		"tree-03",
		"tree-04",
		"tree-05",
		"tree-07"
	  }
	}
	terrains["sand"] = {
	  name = "sand",
	  trees = {
		"tree-07",
		"tree-09-brown",
	  }
	}
	terrains["sand-dark"] = {
	  name = "sand-dark",
	  trees = {
		"tree-01",
		"tree-07",
		"tree-08-brown",
		"tree-09-brown",
		"tree-09"
	  }
	}
	terrains["dirt"] = {
	  name = "dirt",
	  trees = {
		"tree-01",
		"tree-07",
		"tree-08-brown",
		"tree-09-brown"
	  }
	}
	terrains["dirt-dark"] = {
	  name = "dirt",
	  trees = {
		"tree-08-brown",
		"tree-09-brown"
	  }
	}
	terrains["red-desert"] = {
	  name = "red-desert",
	  trees = {
		"tree-09-red"
	  }
	}
	terrains["red-desert-dark"] = {
	  name = "red-desert-dark",
	  trees = {
		"tree-09-red"
	  }
	}
	-- Alien biomes
	terrains["sand-grey"] = {
	  name = "sand-grey",
	  trees = {
		"tree-09-grey",
		"tree-02-white",
		"tree-09-pink",
		"tree-02-white-sparse",
		"tree-05-green",
		"tree-06-purple",
		"tree-02-yellow"
	  }
	}
	terrains["sand-grey-dark"] = {
	  name = "sand-grey-dark",
	  trees = {
		"tree-09-grey",
		"tree-02-white-sparse",
		"tree-06-cyan",
		"tree-09-pink",
		"tree-05-green",
		"tree-06-purple",
		"tree-02-white",
		"tree-02-yellow",
		"tree-01-green"
	  }
	}
	terrains["sand-dull-dark"] = {
	  name = "sand-dull-dark",
	  trees = {
		"tree-09-pink",
		"tree-09-grey",
		"tree-06-cyan",
		"tree-02-yellow",
		"tree-09-yellow",
		"tree-05-green",
		"tree-06-purple",
		"tree-02-white",
		"tree-01-green",
		"tree-01-orange",
		"tree-02-white-sparse"
	  }
	}
	terrains["dirt-grey"] = {
	  name = "dirt-grey",
	  trees = {
		"tree-09-pink",
		"tree-09-grey",
		"tree-06-cyan",
		"tree-02-white",
		"tree-02-white-sparse",
		"tree-02-yellow",
		"tree-06-purple",
		"tree-05-green",
		"tree-09-yellow",
		"tree-01-green"
	  }
	}
	terrains["dirt-dull"] = {
	  name = "dirt-dull",
	  trees = {
		"tree-06-cyan",
		"tree-09-pink",
		"tree-02-yellow",
		"tree-09-grey",
		"tree-05-green",
		"tree-06-purple",
		"tree-09-yellow",
		"tree-02-white",
		"tree-01-orange",
		"tree-02-white-sparse",
		"tree-04-red",
		"tree-01-green"
	  }
	}
	terrains["dirt-dull-dark"] = {
	  name = "dirt-dull-dark",
	  trees = {
		"tree-06-cyan",
		"tree-06-blue",
		"tree-01-olive",
		"tree-02-yellow",
		"tree-01-green",
		"tree-02-white-sparse",
		"tree-09-pink",
		"tree-06-purple",
		"tree-02-white",
		"tree-09-yellow"
	  }
	}
	terrains["grass-blue-fade"] = {
	  name = "grass-blue-fade",
	  trees = {
		"tree-06-blue",
		"tree-06-purple",
		"tree-06-cyan",
		"tree-01-olive",
		"tree-01-green",
		"tree-02-yellow",
		"tree-01-orange",
		"tree-02-ruby",
		"tree-02-white",
		"tree-09-grey",
		"tree-02-white-sparse",
		"tree-09-pink"
	  }
	}
	terrains["snow"] = {
	  name = "snow",
	  trees = {
		"tree-02-white-sparse",
		"tree-02-white"
	  }
	}
	terrains["grass-purple-fade"] = {
	  name = "grass-purple-fade",
	  trees = {
		"tree-06-blue",
		"tree-06-purple",
		"tree-01-green",
		"tree-01-olive",
		"tree-02-ruby",
		"tree-02-white-sparse",
		"tree-01-orange",
		"tree-02-yellow"
	  }
	}
	terrains["dirt-grey-dark"] = {
	  name = "dirt-grey-dark",
	  trees = {
		"tree-06-cyan",
		"tree-06-blue",
		"tree-02-white",
		"tree-02-white-sparse",
		"tree-04-red",
		"tree-02-yellow",
		"tree-09-yellow",
		"tree-02-ruby",
		"tree-05-green",
		"tree-06-purple"
	  }
	}
	terrains["grass-blue"] = {
	  name = "grass-blue",
	  trees = {
		"tree-06-blue",
		"tree-06-purple",
		"tree-02-white",
		"tree-06-cyan",
		"tree-02-white-sparse",
		"tree-01-green",
		"tree-09-pink",
		"tree-09-yellow",
		"tree-04-red",
		"tree-01-orange",
		"tree-02-ruby",
		"tree-01-olive",
		"tree-02-yellow"
	  }
	}
	terrains["grass-purple"] = {
	  name = "grass-purple",
	  trees = {
		"tree-06-purple",
		"tree-06-blue",
		"tree-02-white",
		"tree-01-orange",
		"tree-02-yellow",
		"tree-02-white-sparse",
		"tree-02-ruby",
		"tree-04-red"
	  }
	}
	terrains["sand-dull"] = {
	  name = "sand-dull",
	  trees = {
		"tree-09-pink",
		"tree-09-grey",
		"tree-09-yellow",
		"tree-02-white",
		"tree-05-green",
		"tree-06-purple",
		"tree-01-orange",
		"tree-02-white-sparse",
		"tree-02-yellow",
		"tree-02-orange",
		"tree-04-red"
	  }
	}
	terrains["grass-yellow-fade"] = {
	  name = "grass-yellow-fade",
	  trees = {
		"tree-01-green",
		"tree-05-green",
		"tree-01-olive",
		"tree-02-yellow",
		"tree-02-orange",
		"tree-08-yellow",
		"tree-01-orange",
		"tree-02-ruby",
		"tree-09-yellow",
		"tree-06-cyan",
		"tree-06-purple",
		"tree-09-pink",
		"tree-02-white-sparse",
		"tree-04-orange"
	  }
	}
	terrains["volcanic-hot"] = {
	  name = "volcanic-hot",
	  trees = {
		"tree-01-green",
		"tree-04-red",
		"tree-04-orange",
		"tree-02-white",
		"tree-02-white-sparse",
		"tree-06-purple",
		"tree-09-ruby",
		"tree-05-green",
		"tree-02-ruby",
		"tree-01-orange",
		"tree-09-pink",
		"tree-09-yellow",
		"tree-09-grey"
	  }
	}
	terrains["sand-gold-dark"] = {
	  name = "sand-gold-dark",
	  trees = {
		"tree-09-yellow",
		"tree-02-yellow",
		"tree-05-green",
		"tree-02-white",
		"tree-06-purple",
		"tree-02-ruby",
		"tree-01-orange",
		"tree-09-pink",
		"tree-09-red",
		"tree-01-green",
		"tree-02-white-sparse"
	  }
	}
	terrains["sand-gold"] = {
	  name = "sand-gold",
	  trees = {
		"tree-09-yellow",
		"tree-06-purple",
		"tree-05-green",
		"tree-02-white",
		"tree-01-orange",
		"tree-09-red",
		"tree-02-ruby",
		"tree-01-green",
		"tree-02-white-sparse",
		"tree-09-pink",
		"tree-09-brown",
		"tree-04-orange",
		"tree-02-yellow"
	  }
	}
	terrains["grass-yellow"] = {
	  name = "grass-yellow",
	  trees = {
		"tree-05-green",
		"tree-02-orange",
		"tree-08-yellow",
		"tree-01-olive",
		"tree-01-orange",
		"tree-02-yellow",
		"tree-02-ruby",
		"tree-01-green",
		"tree-02-white-sparse",
		"tree-06-purple",
		"tree-09-pink",
		"tree-02-white",
		"tree-09-yellow",
		"tree-06-cyan"
	  }
	}
	terrains["dirt-tan"] = {
	  name = "dirt-tan",
	  trees = {
		"tree-02-yellow",
		"tree-09-yellow",
		"tree-09-ruby",
		"tree-06-purple",
		"tree-09-pink"
	  }
	}
	terrains["sand-orange-dark"] = {
	  name = "sand-orange-dark",
	  trees = {
		"tree-09-yellow",
		"tree-09-ruby",
		"tree-02-yellow",
		"tree-02-ruby",
		"tree-06-purple",
		"tree-09-red",
		"tree-09-brown",
	  }
	}
	terrains["sand-orange"] = {
	  name = "sand-orange",
	  trees = {
		"tree-09-yellow",
		"tree-09-ruby",
		"tree-06-purple",
		"tree-02-yellow",
	  }
	}
	terrains["dirt-tan-dark"] = {
	  name = "dirt-tan-dark",
	  trees = {
		"tree-02-ruby",
		"tree-02-orange",
		"tree-08-yellow",
		"tree-01-olive",
		"tree-06-cyan",
		"tree-01-orange",
		"tree-09-ruby",
		"tree-06-purple",
		"tree-09-yellow",
		"tree-09-pink",
		"tree-04-red"
	  }
	} 
	terrains["sand-red-dark"] = {
	  name = "sand-red-dark",
	  trees = {
		"tree-09-yellow",
		"tree-09-ruby",
		"tree-02-ruby",
		"tree-02-yellow"
	  }
	}
	terrains["sand-red"] = {
	  name = "sand-red",
	  trees = {
		"tree-09-ruby",
		"tree-09-yellow",
		"tree-09-brown",
		"tree-06-purple",
		"tree-05-green",
		"tree-01-green",
		"tree-04-red",
		"tree-06-cyan",
		"tree-09-pink"
	  }
	}
	terrains["grass-orange"] = {
	  name = "grass-orange",
	  trees = {
		"tree-02-orange",
		"tree-01-orange",
		"tree-04-red",
		"tree-04-orange",
		"tree-08-yellow",
		"tree-02-yellow",
		"tree-09-ruby",
		"tree-09-yellow"
	  }
	}
	terrains["dirt-brown"] = {
	  name = "dirt-brown",
	  trees = {
		"tree-02-orange",
		"tree-08-yellow",
		"tree-02-yellow",
		"tree-02-ruby",
		"tree-01-orange",
		"tree-04-orange",
		"tree-06-cyan",
		"tree-06-purple",
		"tree-09-yellow"
	  }
	}
	terrains["dirt-brown-dark"] = {
	  name = "dirt-brown-dark",
	  trees = {
		"tree-02-orange",
		"tree-08-yellow",
		"tree-01-orange",
		"tree-02-yellow",
		"tree-02-ruby",
		"tree-04-orange",
		"tree-04-red",
		"tree-06-purple",
		"tree-09-pink",
		"tree-01-olive"
	  }
	}
	terrains["grass-red"] = {
	  name = "grass-red",
	  trees = {
		"tree-01-orange",
		"tree-04-red",
		"tree-04-orange",
		"tree-02-white",
		"tree-05-green",
		"tree-06-purple",
		"tree-02-yellow",
		"tree-09-yellow",
		"tree-02-white-sparse"
	  }
	}
	terrains["volcanic-cool"] = {
	  name = "volcanic-cool",
	  trees = {
		"tree-04-red",
		"tree-04-orange",
		"tree-02-white",
		"tree-06-purple",
		"tree-05-green",
		"tree-02-ruby",
		"tree-09-ruby",
		"tree-09-pink"
	  }
	}
	terrains["volcanic-medium"] = {
	  name = "volcanic-medium",
	  trees = {
		"tree-04-red",
		"tree-04-orange",
		"tree-02-yellow",
		"tree-02-ruby",
		"tree-09-ruby",
		"tree-09-yellow"
	  }
	}
	terrains["dirt-red-dark"] = {
	  name = "dirt-red-dark",
	  trees = {
		"tree-01-orange",
		"tree-04-red",
		"tree-04-orange",
		"tree-02-yellow",
		"tree-02-ruby",
		"tree-06-cyan",
		"tree-09-yellow"
	  }
	}
	terrains["dirt-red"] = {
	  name = "dirt-red",
	  trees = {
		"tree-04-orange",
		"tree-02-ruby",
		"tree-01-orange",
		"tree-04-red",
		"tree-02-yellow"

	  }
	}
		   

   for i, terrain in pairs (terrains) do
      if (terrain.name == terrain_name) then 
         return get_random_from_table (terrain.trees)
      end
   end
end



local function Grow_tree(pos, surface)
	
	local foundtree = false
	--local surface = game.surfaces[1]
	local tree = surface.find_entity("seedling", pos)
	local currentTilename = surface.get_tile(pos.x, pos.y).name
	local fertility = 0 -- fertility will be zero if terrain type not listed above, so nothing will grow on it.
	local growth_chance = math.random(100) -- Random value. Tree will grow if it's this value is smaller that the 'Fertility' value

				
	if tree then
		foundtree = true
		tree.destroy()
		
		--- Depending on Terain, choose tree type & Convert seedling into a tree
		
		
		if get_random_tree_for_terrain (currentTilename) and Bi_Industries.fertility[currentTilename] then
			fertility = Bi_Industries.fertility[currentTilename]
	
			treetype = get_random_tree_for_terrain (currentTilename)

			writeDebug("The current tile is: " .. currentTilename)
			writeDebug("The Growth Chance is: " .. growth_chance)
			writeDebug("The Fertility is: " .. fertility)
			writeDebug("The Tree what will grow is: " .. treetype)

			if growth_chance <= fertility and foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
			end

		
		---- Hardcode anything else to tree 9 for now.
		else
			treetype = "tree-09"
			
			writeDebug("Terrain or Fertility not found")
			writeDebug("The Growth Chance is: " .. growth_chance)
			writeDebug("The Fertility is: " .. fertility)
			if growth_chance <= fertility and foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
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






