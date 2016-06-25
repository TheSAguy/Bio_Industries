
railpictures_c = function()
  return railpicturesinternal_c({{"metals", "metals"}, {"backplates", "backplates"}, {"ties", "ties"}, {"stone_path", "stone-path"}})
end


railpicturesinternal_c = function(elems)
  --[[
  local keys = {{"straight_rail", "horizontal", 64, 64},
                  {"straight_rail", "vertical", 64, 64},
                {"straight_rail", "diagonal", 64, 64},
                {"curved_rail", "vertical", 128, 256},
                {"curved_rail" ,"horizontal", 256, 128}}]]

  local keys = {{"straight_rail", "horizontal", 128, 128},
                {"straight_rail", "vertical", 128, 128},
                {"straight_rail", "diagonal", 128, 128},
                {"curved_rail", "vertical", 256, 512},
                {"curved_rail" ,"horizontal", 512, 256}}
  local res = {}
  for _ , key in ipairs(keys) do
    part = {}
    dashkey = key[1]:gsub("_", "-")
    for _ , elem in ipairs(elems) do
      part[elem[1]] = {
        filename = string.format("__Bio_Industries__/graphics/entities/wood_products/%s-concrete/%s-%s-%s.png", dashkey, dashkey, key[2], elem[2]),
        priority = "extra-high",
		scale = 0.5,
        width = key[3],
        height = key[4]
      }
    end
    res[key[1] .. "_" .. key[2]] = part
  end
  res["rail_endings"] = {
    sheet =
    {
      filename = "__Bio_Industries__/graphics/entities/wood_products/rail-endings/rail-endings-concrete.png",
      priority = "high",
	  --scale = 0.5,
      width = 88,
      height = 82
    }
  }
  return res
end
