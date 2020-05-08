return function (mod_name)
    local common = {}

    ------------------------------------------------------------------------------------
    -- Get mod name and path to mod
    common.modName = mod_name
    common.modRoot = "__" .. mod_name .. "__"

    ------------------------------------------------------------------------------------
    -- Enable writing to log file until startup options are set, so debugging output
    -- from the start of a game session can be logged. This depends on a locally
    -- installed dummy mod to allow debugging output during development without
    -- spamming real users.
    ------------------------------------------------------------------------------------
    local function is_debug()
        local debugging
        -- If the "_debug" is active, debugging will always be on. If you don't have this
        -- dummy mod but want to turn on logging anyway, set the default value to "true"!
        local default = false

        if game then
            debugging = game.active_mods["_debug"] and true or default
        elseif mods then
            debugging = mods and mods["_debug"] and true or default
        end
        return debugging
    end


    --------------------------------------------------------------------
    --- DeBug Messages
    common.writeDebug = function (message)
      if is_debug() then
        log(tostring(message))
        if game then
          game.print(tostring(message))
        end
      end
    end

    ------------------------------------------------------------------------------------
    -- Are tiles from Alien Biomes available? (Returns true or false)
    common.AB_tiles = function()

      local ret = false

      if game then
        local AB = game.item_prototypes["fertiliser"].place_as_tile_result.result.name
        -- In data stage, place_as_tile is only changed to Alien Biomes tiles if
        -- both "vegetation-green-grass-1" and "vegetation-green-grass-3" exist. Therefore,
        -- we only need to check for one tile in the control stage.
        ret = (AB == "vegetation-green-grass-3") and true or false
      else
        ret = data.raw.tile["vegetation-green-grass-1"] and
              data.raw.tile["vegetation-green-grass-3"] and true or false
      end

      return ret
    end

return common
end
