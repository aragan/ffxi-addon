_addon.author   = 'Kaotic'
_addon.version  = '1.2'
_addon.commands = {'Quetz'}

require('logger')
require('coroutine')
packets = require('packets')
res = require('resources')

local conditions = {

	quetzPortal = false,
	goblin = false,
	reisenPortal = false,
	running = false,
	quetzAlive = false,
	quetzDead = false,
	
}

function stop()
	
	windower.send_command('lua unload quetz')
	
end


function start()
	log('Waiting for pop zZz...')
	local quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	quetzDead = true
	while quetzDead do
		if quetz.hpp > 0 then
			quetzDead = false
		end
		coroutine.sleep(.25)
		quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	end
	log('zomg pop quick claim it!')
	fight()
end


function fight()
	coroutine.sleep(1)
	log('Whoooo we got it boizzzz!')
	local quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	quetzAlive = true
	while quetzAlive do
		if quetz.hpp == 0 then
			quetzAlive = false
		end
		coroutine.sleep(.25)
		quetz = windower.ffxi.get_mob_by_name('Quetzalcoatl')
	end
	exitArena()
end

function exitArena()
	
	local player = windower.ffxi.get_player()
	
	if player.vitals.hp == 0 then
		log('You died =( Shutting down.')
		coroutine.sleep(30)
		windower.send_command('setkey enter down')
		coroutine.sleep(.05)
		windower.send_command('setkey enter up')
		coroutine.sleep(.05)
		windower.send_command('quetz stop')
		--log('Raise accepted,')
		--coroutine.sleep(30)
		--windower.send_command('input /equip ring2 "Dim. Ring (Holla)"')
		--coroutine.sleep(10)
		--windower.send_command('input /item "Dim. Ring (Holla)" <me>')
		--coroutine.sleep(45)
		--enterReisen()
	else
		log("Fight's over, teleporting in 5 minutes.")
		coroutine.sleep(10)

		windower.send_command('input /equip ring2 "Dim. Ring (Holla)"')
		coroutine.sleep(.05)
		windower.send_command('input //lua unload enternity')
		coroutine.sleep(15)
		windower.send_command('input /item "Dim. Ring (Holla)" <me>')
		coroutine.sleep(25)
		enterReisen()
	end

end


function enterReisen()

	log('Entering Reisenjima in 1 minute.')
	
	coroutine.sleep(30)
	
	local me = windower.ffxi.get_mob_by_target('me')
	local tp = windower.ffxi.get_mob_by_name('Dimensional Portal')
	
	
	windower.ffxi.run(tp.x - me.x, tp.y - me.y, tp.z - me.z)
	conditions['running'] = true
	while conditions['running'] do
		if(math.sqrt(tp.distance)) < 3 then
			conditions['running'] = false
		end
		tp = windower.ffxi.get_mob_by_name('Dimensional Portal')
	end
	windower.ffxi.run(false)
	
    if tp then
        local p = packets.new('outgoing', 0x01A, {
            ['Target'] = tp.id,
            ['Target Index'] = tp.index,
        })
        packets.inject(p)
    end

	coroutine.sleep(10)
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(7)
	windower.send_command('setkey up down')
	coroutine.sleep(.05)
	windower.send_command('setkey up up')
	coroutine.sleep(.50)
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(.50)
	
	log('Obtaining Elvorseal in 22 minutes.')
	coroutine.sleep(1400)
	
	enterArena()

end


function enterArena()

	log('Obtaining Elvorseal')
	
	local gob = windower.ffxi.get_mob_by_name('Shiftrix')
    if gob then
        local p = packets.new('outgoing', 0x01A, {
            ['Target'] = gob.id,
            ['Target Index'] = gob.index,
        })
        packets.inject(p)
    end
	
	coroutine.sleep(10)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(7)
	
	windower.send_command('setkey down down')
	coroutine.sleep(.05)
	windower.send_command('setkey down up')
	coroutine.sleep(.5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey up down')
	coroutine.sleep(.05)
	windower.send_command('setkey up up')
	coroutine.sleep(.1)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(5)
	
	log('Elvorseal obtained, moving to fighting location in 1 minute.')
	coroutine.sleep(15)
	
	moveToLocation()

end


function moveToLocation()

	coroutine.sleep(1)
	windower.ffxi.turn(-3.65)
	coroutine.sleep(.5)
	log('Moving to pull location.')
	windower.ffxi.run(true)
	coroutine.sleep(4)
	windower.ffxi.run(false)
	log('Arrived at pull location.')
	coroutine.sleep(.5)
	log('Summoning Trusts')
	coroutine.sleep(.5)
	
	--Here is where you can edit the trust list that you wish to summon
	--Remove the -- infront of the lines if you want to use additional trusts, I use 4 of the same ones for each character and use easyfarm to summon the other character specific one.
	--If you use easyfarm for trusts, put -- in front of each line 246-254, but I recommend putting them in the Battle tab.
	
	windower.send_command('input /ma "Sylvie (UC)" <me>')
	coroutine.sleep(8)
	windower.send_command('input /ma "Joachim" <me>')
	coroutine.sleep(8)
	windower.send_command('input /ma "qultada" <me>')
	coroutine.sleep(8)
	windower.send_command('input /ma "lilisette II" <me>')
	coroutine.sleep(8)
	windower.send_command('input /ma "Ulmia" <me>')
	coroutine.sleep(5)
	
	coroutine.sleep(10)
	start()

end


function test()


	local zone = windower.ffxi.get_info()
		log(zone.zone)

end



windower.register_event('addon command', function(input, ...)
    local cmd = string.lower(input)
	local args = {...}
	
	if cmd == 'stop' then
		stop()
    elseif cmd == 'start' then
		start()
	elseif cmd == 'exit' then
		exitArena()
	elseif cmd == 'enter' then
		enterArena()
	elseif cmd == 'move' then
		moveToLocation()
	elseif cmd == 'test' then
		test()
	elseif cmd == 'fight' then
		fight()
	elseif cmd == 'reisen' then
		enterReisen()
    end
end)