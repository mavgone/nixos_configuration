Name = "wallpapers"
NamePretty = "Wallpapers"
Action = "~/.local/bin/set-wallpaper '%VALUE%'"

function GetEntries()
	local entries = {}

	local handle = io.popen("find /home/mavgone/Pictures/Wallpapers -maxdepth 1 -type f")

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
