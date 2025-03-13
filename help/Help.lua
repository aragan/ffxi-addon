_addon.name = 'help'
_addon.author = 'unknow , Aragan@Asura'
_addon.version = '1.0.0.6'
_addon.command = 'help'

windower.register_event('incoming text',function(org)     

	--abyssea stagger
	if string.find(org, "staggers") then
		windower.send_command('input /p Stagger! <call14>!')
	end
	
	--Yegasumi
	if string.find(org, "Yaegasumi") then
		--windower.send_command('input /p Yega! > Disengage! <call14>!')
	end
	
	indexstart, indexend = string.find(org:lower(),"impish")
	if indexstart then
       -- windower.send_command('input /p '..string.sub(org,1,indexstart)..' wore off! <call15>')
	   --windower.send_command('input /p '..string.sub(org,1,7)..' Got BOX!!!! <call15>')
    end
	
	--Bozetto Retributionist Ambu (horse + Dulahan)
	--if string.find(org, "emit a noxious miasma") then
	--	windower.send_command('input /p Miasma STARTING! > WS his Ass! <call14>!')
	--end
	--if string.find(org, "miasma dissipates") then
	--	windower.send_command('input /p Miasma ENDING! > Disengage! <call14>!')
	--	windower.send_command('sends /attack off;wait 2;/attack off')
	--end
	--if string.find(org, "boil over") then
	--	windower.send_command('input /p Boiling Over! > Disengage! <call14>!')
	--	windower.send_command('sends /attack off;wait 2;/attack off')
	--end	
	--if string.find(org, "begins charging up") then
	--	windower.send_command('input /p Charging! > Keep Going! <call14>!')
	--end
	--[[if string.find(org, "Noahionto") then
	    windower.send_command('input /p Noahionto Charging! > > Disengage! <call14>!')
	end]]
	
	--[[ 
	if string.find(org, "Flaming Kick") or string.find(org, "Demonfire") then
		windower.send_command('input /p NUKE! > Water Water Water! <call14>!')
	end

	if string.find(org, "Flashflood") or string.find(org, "Torrential Pain") then
		windower.send_command('input /p NUKE! > Thunder Thunder Thunder! <call14>!')
	end
	if string.find(org, "Icy Grasp") or string.find(org, "Frozen Blood") then
		windower.send_command('input /p NUKE! > Fire Fire Fire! <call14>!')
	end
	if string.find(org, "Eroding Flesh") or string.find(org, "Ensepulcher") then
		windower.send_command('input /p NUKE! > Wind Wind Wind! <call14>!')
	end
	if string.find(org, "Fulminous Smash") or string.find(org, "Ceaseless Surge") then
		windower.send_command('input /p NUKE! > Stone Stone Stone! <call14>!')
	end
	if string.find(org, "Blast of Reticence") then
		windower.send_command('input /p NUKE! > Ice Ice Ice! <call14>!')
	end
	]]
	
	--Sortie
	indexstart, indexend = string.find(org,"treasure coffer status report")
	if indexstart ~= nil then
		windower.send_command('input /p '..string.sub(org,0,indexstart-1)..' '..string.sub(org,indexend+1))
	end

	--Entry
	if string.find(org, "Nightmare number") then
		windower.send_command('input /p '..org:gsub("Nightmare number", "Entry:"))
	end
	--rabao
	indexstart, indexend = string.find(org,"You are currently number ")
	if indexstart ~= nil and string.len(org) == 65 then
		
		local you = tonumber(string.sub(org,indexend, indexend+3))
		local them = tonumber(string.sub(org,indexend+18, indexend+21))
		windower.send_command('input /p Queue > Pos: '..you..' Actual: '..them..' Lenght: '..(you-them))
		
	end
	--khamir
	indexstart, indexend = string.find(org,"You are currently number")
	if indexstart ~= nil and string.len(org) == 67 then
		local you = tonumber(string.sub(org,indexend+2, indexend+5))
		local them = tonumber(string.sub(org,indexend+21, indexend+24))
		windower.send_command('input /p Queue > Pos: '..you..' Actual: '..them..' Lenght: '..(you-them))
		
	end
	--omen
	indexstart, indexend = string.find(org,"You are currently number")
	if indexstart ~= nil and string.len(org) == 63 then
		local you = tonumber(string.sub(org,indexend+1, indexend+3))
		local them = tonumber(string.sub(org,indexend+18, indexend+20))
		windower.send_command('input /p Queue > Pos: '..you..' Actual: '..them..' Lenght: '..(you-them))
	end
end)