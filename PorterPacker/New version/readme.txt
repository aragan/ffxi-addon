 == 'help' then
		notice('Commands: command | alias [optional]')
		notice(' //porterpacker | //packer | //po')
		notice(' export | exp [file] [all | a]		   - exports storable items in your current inventory to a .lua file')
		notice(' pack | store | p [file] [all | a]	  - stores current inventory items, if file is specified only items in the file will be stored')
		notice(' unpack | retrieve | u [file] [all | a] - retrieves matching items in the file from a porter moogle. file defaults to Name_JOB.lua or JOB.lua')
		notice(' repack | swap | r [file] [all | a]	- stores inventory items not in the file and retrieves matching items. file defaults to Name_JOB.lua or JOB.lua')
		notice(' all will search your Wardrobes to return items and store any items you pull into available wardrobe space')
	elseif commands[1] == 'export' or commands[1] == 'exp' then