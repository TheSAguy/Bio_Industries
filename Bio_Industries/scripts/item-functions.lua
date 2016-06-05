function bobmods.lib.basic_item (inputs)
  local item = {}

  if inputs.name then
    item.name = inputs.name
  else
    item.name = inputs[1]
  end

  if inputs.amount then
    item.amount = inputs.amount
  else
    if inputs[2] then
      item.amount = inputs[2]
    end
  end
  if not item.amount then
    item.amount = 1
  end

  if inputs.type then
    item.type = inputs.type
  else
    item.type = bobmods.lib.get_basic_item_type(item.name)
  end

  return item
end

function bobmods.lib.item (inputs)
  local item = {}

  if inputs.name then
    item.name = inputs.name
  else
    item.name = inputs[1]
  end

  if inputs.amount then
    item.amount = inputs.amount
  else
    if inputs[2] then
      item.amount = inputs[2]
    end
  end
  if not item.amount then
    if inputs.amount_min and inputs.amount_max then
      item.amount_min = inputs.amount_min
      item.amount_max = inputs.amount_max
    else
      item.amount = 1
    end
  end
  if inputs.probability then item.probability = inputs.probability end

  if inputs.type then
    item.type = inputs.type
  else
    item.type = bobmods.lib.get_basic_item_type(item.name)
  end

  return item
end

function bobmods.lib.get_item_type(name)
  local item_types = {"ammo", "armor", "capsule", "fluid", "gun", "mining-tool", "module", "tool"}
  local item_type = "item"
  for i, type_name in pairs(item_types) do
    for j, item in pairs(data.raw[type_name]) do
      if item.name == name then item_type = type_name end
    end
  end
  return item_type
end

function bobmods.lib.get_basic_item_type(name)
  local item_types = {"fluid"}
  local item_type = "item"
  for i, type_name in pairs(item_types) do
    for j, item in pairs(data.raw[type_name]) do
      if item.name == name then item_type = type_name end
    end
  end
  return item_type
end


function bobmods.lib.combine_items(item1_in, item2_in)
  local item = {}
  local item1 = bobmods.lib.item(item1_in)
  local item2 = bobmods.lib.item(item2_in)

  item.name = item1.name
  item.type = item1.type

  if item1.amount and item2.amount then
    item.amount = item1.amount + item2.amount
  elseif item1.amount_min and item1.amount_max and item2.amount_min and item2.amount_max then
    item.amount_min = item1.amount_min + item2.amount_min
    item.amount_max = item1.amount_max + item2.amount_max
  else
    if item1.amount_min and item1.amount_max and item2.amount then
      item.amount_min = item1.amount_min + item2.amount
      item.amount_max = item1.amount_max + item2.amount
    elseif item1.amount and item2.amount_min and item2.amount_max then
      item.amount_min = item1.amount + item2.amount_min
      item.amount_max = item1.amount + item2.amount_max
    end
  end

  if item1.probability and item2.probability then
    item.probability = (item1.probability + item2.probability) / 2
  elseif item1.probability then
    item.probability = (item1.probability + 1) / 2
  elseif item2.probability then
    item.probability = (item2.probability + 1) / 2
  end

  return item
end


function bobmods.lib.add_item(list, item_in) --increments amount if exists
  local item = bobmods.lib.item(item_in)
  local addit = true
  for i, object in pairs(list) do
    if object[1] == item.name or object.name == item.name then
      addit = false
      object = bobmods.lib.combine_items(object, item)
    end
  end
  if addit then table.insert(list, item) end
end

function bobmods.lib.add_new_item(list, item_in) --ignores if exists
  local item = bobmods.lib.item(item_in)
  local addit = true
  for i, object in pairs(list) do
    if item.name == bobmods.lib.item(object).name then addit = false end
  end
  if addit then table.insert(list, item) end
end

function bobmods.lib.remove_item(list, item) --ignores if exists
  for i, object in ipairs(list) do
    if object[1] == item or object.name == item then
      table.remove(list, i)
    end
  end
end


function bobmods.lib.result_check(object)
  if object.results == nil then 
    object.results = {}
  end

  if object.result then
    local item = {name = object.result}
    if object.result_count then
      item.amount = object.result_count
      object.result_count = nil
    end
    bobmods.lib.add_new_item(object.results, item)

    if object.ingredients then  -- It's a recipe
      if not object.main_product then
        if object.icon or object.subgroup or object.order then -- if we already have one add the rest
          if not object.icon and data.raw.recipe[object.result].icon then
            object.icon = data.raw.recipe[object.result].icon 
          end
          if not object.subgroup and data.raw.recipe[object.result].subgroup then
            object.subgroup = data.raw.recipe[object.result].subgroup
          end
          if not object.order and data.raw.recipe[object.result].order then
            object.order = data.raw.recipe[object.result].order 
          end
        else -- otherwise just use main_product as a cheap way to set them all.
          object.main_product = object.result
        end
      end
    end
    object.result = nil
  end
end

