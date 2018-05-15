infinite_fluids = require("prototypes.Bio_Drill.supported-resources")

local x = 1
local d = {}

for _, resource in pairs(infinite_fluids) do
  local order = ""
  local default_value = false

  if x < 10 then
    order = "f1" .. x
  else
    order = "f" .. x
  end

  if resource.default ~= nil then
    default_value = resource.default
  end

  if mods[resource.dependency] then
    table.insert(d, 
    {
      type = "bool-setting",
      name = "bi_" .. resource.name,
      order = order,
      setting_type = "startup",
      default_value = default_value,
      localised_name = {"entity-name."..resource.name},
      localised_description = {"mod-setting-description.BI_finite_description"}
    })

    x = x + 1
  end
end

data:extend(d)