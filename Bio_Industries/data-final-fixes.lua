

---- Inrease Wood Stack Size
if data.raw.item["raw-wood"].stack_size < 400 then
	data.raw.item["raw-wood"].stack_size = 400
end


-- 5dim Stack changes
if settings.startup["5d-change-stack"] and settings.startup["5d-change-stack"].value then
   if data.raw.item["raw-wood"] then
      data.raw.item["raw-wood"].stack_size = math.max(210, data.raw.item['raw-wood'].stack_size)
   end
end


if settings.startup["angels-use-angels-barreling"] and settings.startup["angels-use-angels-barreling"].value then
   data.raw.technology["bi-fertiliser"].prerequisites = 
      {
         "bi_bio_farming",
         -- AND (
         "water-treatment", -- sulfur
         -- OR
         "angels-fluid-barreling", -- barreling (needed 'water-treatment' as prerequisites)
         -- )
      }
end
