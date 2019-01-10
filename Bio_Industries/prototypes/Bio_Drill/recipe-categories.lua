if settings.startup["BI_Bio_Infinite_Fluids"] and settings.startup["BI_Bio_Infinite_Fluids"].value == true then

	data:extend(
	{
		
		{
			type = "recipe-category",
			name = "bi-drill"
		},
	}
	)

end