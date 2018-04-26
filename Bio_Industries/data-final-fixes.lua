


-- 5dim Stack changes
if settings.startup["5d-change-stack"] and settings.startup["5d-change-stack"].value then
   if data.raw.item["raw-wood"] then
      data.raw.item["raw-wood"].stack_size = math.max(210, data.raw.item['raw-wood'].stack_size)
   end
end


if settings.startup["angels-use-angels-barreling"] and settings.startup["angels-use-angels-barreling"].value then
   data.raw.technology["bi_tech_fertiliser"].prerequisites = 
      {
         "bi_tech_bio_farming",
         -- AND (
         "water-treatment", -- sulfur
         -- OR
         "angels-fluid-barreling", -- barreling (needed 'water-treatment' as prerequisites)
         -- )
      }
end


---- Game Tweaks ----
if BI.Settings.BI_Recipe_Tweaks then

	---- Inrease Wood Stack Size
	if data.raw.item["raw-wood"] and data.raw.item["raw-wood"].stack_size < 400 then
		data.raw.item["raw-wood"].stack_size = 400
	end

	--- Stone Stack Size	
	if data.raw.item["stone"] and data.raw.item["stone"].stack_size < 400 then
		data.raw.item["stone"].stack_size = 400
	end	
	
	--- Crushed Stone Stack Size	
	if data.raw.item["stone-crushed"] and data.raw.item["stone-crushed"].stack_size < 600 then
		data.raw.item["stone-crushed"].stack_size = 600
	end		
	
	--- Concrete Stack Size	
	if data.raw.item["concrete"] and data.raw.item["concrete"].stack_size < 400 then
		data.raw.item["concrete"].stack_size = 400
	end		
	
	--- Slag Stack Size	
	if data.raw.item["slag"] and data.raw.item["slag"].stack_size < 800 then
		data.raw.item["slag"].stack_size = 800
	end		
		
end