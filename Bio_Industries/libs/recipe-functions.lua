if not thxbob.lib.recipe then thxbob.lib.recipe = {} end


function thxbob.lib.recipe.replace_ingredient(recipe, old, new)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_type(new) then
    local amount = 0
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
      if ingredient[1] == old then
        amount = ingredient[2] + amount
      end
      if ingredient.name == old then
        amount = ingredient.amount + amount
      end
    end
    if amount > 0 then
      thxbob.lib.recipe.remove_ingredient(recipe, old)
      thxbob.lib.recipe.add_ingredient(recipe, {new, amount})
    end
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not thxbob.lib.item.get_type(new) then
      log("Ingredient " .. new .. " does not exist.")
    end
  end
end

function thxbob.lib.recipe.replace_ingredient_crude(recipe, old, new)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_basic_type(new) then
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
      if ingredient[1] == old or ingredient.name == old then
        local item = thxbob.lib.item.basic_item(ingredient)
        item.name = new
        item.type = thxbob.lib.item.get_basic_type(new)
        ingredient = item
      end
    end
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not thxbob.lib.item.get_type(new) then
      log("Ingredient " .. new .. " does not exist.")
    end
  end
end

function thxbob.lib.recipe.replace_ingredient_in_all(old, new)
  if thxbob.lib.item.get_basic_type(new) then
    for i, recipe in pairs(data.raw.recipe) do
      thxbob.lib.recipe.replace_ingredient(recipe.name, old, new)
    end
  else
    log("Ingredient " .. new .. " does not exist.")
  end
end

function thxbob.lib.recipe.remove_ingredient(recipe, item)
  if data.raw.recipe[recipe] then
    thxbob.lib.item.remove(data.raw.recipe[recipe].ingredients, item)
  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end

function thxbob.lib.recipe.add_new_ingredient(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_basic_type(item) then
    thxbob.lib.item.add_new(data.raw.recipe[recipe].ingredients, thxbob.lib.item.basic_item(item))
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not thxbob.lib.item.get_type(item) then
      log("Ingredient " .. item .. " does not exist.")
    end
  end
end

function thxbob.lib.recipe.add_ingredient(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_basic_type(item) then
    thxbob.lib.item.add(data.raw.recipe[recipe].ingredients, thxbob.lib.item.basic_item(item))
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not thxbob.lib.item.get_type(item) then
      log("Ingredient " .. item .. " does not exist.")
    end
  end
end


function thxbob.lib.recipe.add_result(recipe, item)
  if data.raw.recipe[recipe] and thxbob.lib.item.get_basic_type(item) then
    thxbob.lib.result_check(data.raw.recipe[recipe])
    thxbob.lib.item.add(data.raw.recipe[recipe].results, item)
  else
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
    if not thxbob.lib.item.get_type(item) then
      log("Ingredient " .. item .. " does not exist.")
    end
  end
end

function thxbob.lib.recipe.remove_result(recipe, item)
  if data.raw.recipe[recipe] then
    thxbob.lib.result_check(data.raw.recipe[recipe])
    thxbob.lib.item.remove(data.raw.recipe[recipe].results, item)
  else
    log("Recipe " .. recipe .. " does not exist.")
  end
end



