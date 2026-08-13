Name = "wallpapers"
NamePretty = "Wallpapers"
Action = "~/.local/bin/set-wallpaper '%VALUE%'"

function GetEntries()
	local entries = {}

	local home = os.getenv("HOME")

	local dirs = {
		home .. "/Pictures/Wallpapers",
		home .. "/Pictures/wallpapers",
		home .. "/Pictures/Backgrounds",
		home .. "/Pictures/backgrounds",
		home .. "/Wallpapers",
		home .. "/wallpapers",
		home .. "/Downloads/Wallpapers",
	}

	local wallpaper_dir = nil

	for _, dir in ipairs(dirs) do
		local check = io.popen("[ -d '" .. dir .. "' ] && echo exists")
		if check then
			local result = check:read("*l")
			check:close()

			if result == "exists" then
				wallpaper_dir = dir
				break
			end
		end
	end

	if not wallpaper_dir then
		return entries
	end

	local handle = io.popen("find '" .. wallpaper_dir .. "' -maxdepth 1 -type f")

	if not handle then
		return entries
	end

	for path in handle:lines() do
		local filename = path:match("([^/]+)$")

		if filename then
			table.insert(entries, {
				Text = filename,
				Value = path,
				Preview = path,
				PreviewType = "file",
			})
		end
	end

	handle:close()

	return entries
end
