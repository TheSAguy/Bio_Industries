function bobmods.lib.replace_science_pack (technology, old, new)
  if data.raw.technology[technology] then
    local doit = false
    local amount = 0
    for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
      if ingredient[1] == old then
        doit = true
        amount = ingredient[2] + amount
      end
      if ingredient.name == old then
        doit = true
        amount = ingredient.amount + amount
      end
    end
    if doit then
      bobmods.lib.remove_science_pack(technology, old)
      bobmods.lib.add_science_pack(technology, new, amount)
    end
  end
end

function bobmods.lib.add_new_science_pack (technology, pack, amount)
  if data.raw.technology[technology] then
    local addit = true
    for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
      if ingredient[1] == pack or ingredient.name == pack then addit = false end
    end
    if addit then table.insert(data.raw.technology[technology].unit.ingredients,{pack, amount}) end
  end
end

function bobmods.lib.add_science_pack (technology, pack, amount)
  if data.raw.technology[technology] then
    local addit = true
    for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
      if ingredient[1] == pack then
        addit = false
        ingredient[2] = ingredient[2] + amount
      end
      if ingredient.name == pack then
        addit = false
        ingredient.amount = ingredient.amount + amount
      end
    end
    if addit then table.insert(data.raw.technology[technology].unit.ingredients,{pack, amount}) end
  end
end

function bobmods.lib.remove_science_pack (technology, pack)
  if data.raw.technology[technology] then
    for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
      if ingredient[1] == pack or ingredient.name == pack then
        table.remove(data.raw.technology[technology].unit.ingredients, i)
      end
    end
  end
end


function bobmods.lib.add_technology_recipe (technology, recipe)
  if data.raw.technology[technology] and data.raw.recipe[recipe] then
    local addit = true
    if not data.raw.technology[technology].effects then
      data.raw.technology[technology].effects = {}
    end
    for i, effect in pairs(data.raw.technology[technology].effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipe then addit = false end
    end
    if addit then table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe}) end
  end
end

function bobmods.lib.remove_technology_recipe (technology, recipe)
  if data.raw.technology[technology] and data.raw.technology[technology].effects then
    for i, effect in pairs(data.raw.technology[technology].effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipe then
        table.remove(data.raw.technology[technology].effects,i)
      end
    end
  end
end


function bobmods.lib.replace_technology_prerequisite (technology, old, new)
  if data.raw.technology[technology] and data.raw.technology[new] then
    for i, prerequisite in ipairs(data.raw.technology[technology].prerequisites) do
      if prerequisite == old then 
        bobmods.lib.remove_technology_prerequisite(technology, old)
        bobmods.lib.add_technology_prerequisite(technology, new)
      end
    end
  end
end

function bobmods.lib.add_technology_prerequisite (technology, prerequisite)
  if data.raw.technology[technology] and data.raw.technology[prerequisite] then
    local addit = true
    if data.raw.technology[technology].prerequisites then
      for i, check in ipairs(data.raw.technology[technology].prerequisites) do
        if check == prerequisite then addit = false end
      end
    else
      data.raw.technology[technology].prerequisites = {}
    end
    if addit then table.insert(data.raw.technology[technology].prerequisites, prerequisite) end
  end
end

function bobmods.lib.remove_technology_prerequisite (technology, prerequisite)
  if data.raw.technology[technology] then
    for i, check in ipairs(data.raw.technology[technology].prerequisites) do
      if check == prerequisite then
        table.remove(data.raw.technology[technology].prerequisites, i)
      end
    end
  end
end


