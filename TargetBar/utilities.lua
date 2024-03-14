local Resources = require( 'resources' )

local utilities =
{
	-- 装備中の装備品のアイテム識別子を取得する
	GetEquipmentItemId = function( this, category )
		local allItems =  windower.ffxi.get_items()
		local bag, index
		    if( category ==  1 ) then bag = allItems.equipment.main_bag       ; index = allItems.equipment.main
		elseif( category ==  2 ) then bag = allItems.equipment.sub_bag        ; index = allItems.equipment.sub
		elseif( category ==  3 ) then bag = allItems.equipment.range_bag      ; index = allItems.equipment.range
		elseif( category ==  4 ) then bag = allItems.equipment.ammo_bag       ; index = allItems.equipment.ammo
		elseif( category ==  5 ) then bag = allItems.equipment.head_bag       ; index = allItems.equipment.head
		elseif( category ==  6 ) then bag = allItems.equipment.neck_bag       ; index = allItems.equipment.neck
		elseif( category ==  7 ) then bag = allItems.equipment.left_ear_bag   ; index = allItems.equipment.left_ear
		elseif( category ==  8 ) then bag = allItems.equipment.right_ear_bag  ; index = allItems.equipment.right_ear
		elseif( category ==  9 ) then bag = allItems.equipment.body_bag       ; index = allItems.equipment.body
		elseif( category == 10 ) then bag = allItems.equipment.hands_bag      ; index = allItems.equipment.hands
		elseif( category == 11 ) then bag = allItems.equipment.left_ring_bag  ; index = allItems.equipment.left_ring
		elseif( category == 12 ) then bag = allItems.equipment.right_ring_bag ; index = allItems.equipment.right_ring
		elseif( category == 13 ) then bag = allItems.equipment.back_bag       ; index = allItems.equipment.back
		elseif( category == 14 ) then bag = allItems.equipment.waist_bag      ; index = allItems.equipment.waist
		elseif( category == 11 ) then bag = allItems.equipment.legs_bag       ; index = allItems.equipment.legs
		elseif( category == 12 ) then bag = allItems.equipment.feet_bag       ; index = allItems.equipment.feet
		end

--		PrintFF11( "Range : B " .. bag .. ' I ' .. index )


		if( index == nil or index == 0 ) then
			return 0
		end

		local items = windower.ffxi.get_items( bag )
		local itemId = items[ index ].id

		local item = Resources.items[ itemId ]
		if( item ~= nil ) then
--			PrintFF11( "I:" .. item.name )
		end
		
		return itemId
    end,
    

	-- プレイヤーの呪歌の重ねがけ可能回数を取得する
	GetSingingLevel = function( this )
		local itemId = this:GetEquipmentItemId( 3 )
--		PrintFF11( "Range:" .. itemId )
		if( itemId == 0 ) then
			return 1
		end

		if( T{ 17361 }:contains( itemId ) == true ) then
			return 2
		end
		return 1
	end,

}

return utilities
