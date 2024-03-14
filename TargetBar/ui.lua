local Images = require( 'images' )
local Texts  = require( 'texts' )

-- Windower設定取得用インスタンス
local WindowerSettings = windower.get_windower_settings()

-- ＵＩ解像度
local UIScreen = {
	Width  = WindowerSettings.ui_x_res,
	Height = WindowerSettings.ui_y_res,
}

local ui =
{
	-------------------------------------------------------------------
	-- public

	MT_Frame = nil,
	MT_SideL = nil,
	MT_SideR = nil,

	MT_GaugeB = nil,
	MT_GaugeF = nil,

	MT_Name = nil,
	MT_Health = nil,
	MT_Level = nil,

	MT_Rank = nil,
	MT_Action = nil,

	---------------

	Arrow = nil,

	---------------

	ST_Frame = nil,
	ST_SideL = nil,
	ST_SideR = nil,

	ST_GaugeB = nil,
	ST_GaugeF = nil,

	ST_Name = nil,
	ST_Health = nil,
	ST_Level = nil,

	ST_Rank = nil,
	ST_Action = nil,

	---------------

	Scanning = nil,

	-----------------------------------------------------------

	-- バフ効果
	MT_Effects = {},
	ST_Effects = {},

	-------------------------------------------------------------------

	-- private

	settings = {},	-- 設定の参照を保持する

	isLoaded = false,
	loadingWaitTime,

	mtColor = 0,
	stColor = 0,

	-------------------------------------------------------------------

	-- 画像のスタイルを生成して返す
	GetImageStyle = function( this, path, width, height, draggable )
		local data =
		{
			texture = {
				path			= windower.addon_path .. 'images/' .. path,
				fit				= true,
			},
			size = {
				width			= width,
				height			= height,
			},
			repeatable = {
				x				= 1,
				y				= 1,
			},
			draggable			= draggable,
			visible				= false		-- 初期状態では非表示
		}
		return data
	end,

	-- 文字のスタイルを生成して返す
	GetTextStyle = function( this, style, fontSize, right )
		local data =
		{
			padding				= 0,
			text = {
				font			= style.Font,
				fonts			= style.Fonts,
				size			= fontSize,
				alpha			= style.Alpha,
				stroke = {
					width		= style.Stroke.Width,
					alpha		= style.Stroke.Alpha,
				},
			},
			bg = {
				visible		= false,
			},
			flags = {
				bold		= style.Flags.Bold,
				italic		= style.Flags.Italic,
				right		= right,
				bottom		= false,
				draggable	= false,
			},
			visible = false,	-- 初期状態では非表示
		}
		return data
	end,


	-- 関数:リソースをロードする
	Load = function( this, settings )

		-- 設定の参照を保持する
		this.settings = settings

		-------------------------------

		-- MT_Frame
		this.MT_Frame = Images.new( this:GetImageStyle(
			settings.ImagePaths.Frame,
			settings.MTInfo.FrameSize.Width, settings.MTInfo.FrameSize.Height,
			settings.Draggable	-- 初期ではドラッグ可能
		) )

		-- MT_SideL
		this.MT_SideL = Images.new( this:GetImageStyle(
			settings.ImagePaths.SideL,
			settings.MTInfo.SideSize.Width, settings.MTInfo.SideSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- MT_SideR
		this.MT_SideR = Images.new( this:GetImageStyle(
			settings.ImagePaths.SideR,
			settings.MTInfo.SideSize.Width, settings.MTInfo.SideSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- MT_GaugeB
		this.MT_GaugeB = Images.new( this:GetImageStyle(
			settings.ImagePaths.Gauge,
			settings.MTInfo.FrameSize.Width, settings.MTInfo.FrameSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- MT_GaugeF
		this.MT_GaugeF = Images.new( this:GetImageStyle(
			settings.ImagePaths.Gauge,
			settings.MTInfo.FrameSize.Width, settings.MTInfo.FrameSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- MT_Name
		this.MT_Name = Texts.new( this:GetTextStyle( settings.TextStyle, settings.MTInfo.Name.Size, false ) )
		this.MT_Name:text( " " )

		-- MT_Health
		this.MT_Health = Texts.new( this:GetTextStyle( settings.TextStyle, settings.MTInfo.Health.Size, true ) )
		this.MT_Health:text( " " )

		-- MT_Rank
		this.MT_Rank = Texts.new( this:GetTextStyle( settings.TextStyle, settings.MTInfo.Rank.Size, true ) )
		this.MT_Rank:text( " " )

		-- タイプアイコン
		this.MT_Action = {}
		for i = 1, #settings.ActionIcons do
			this.MT_Action[ i ] = Images.new( this:GetImageStyle(
				settings.ActionIcons[ i ],
				16, 16,
				false	-- 初期ではドラッグ不可
			) )
		end

		-- MT_Level
		this.MT_Level = Texts.new( this:GetTextStyle( settings.TextStyle, settings.MTInfo.Level.Size, true ) )
		this.MT_Level:text( " " )

		-- バフ効果アイコン
		for effectId =   0, 640 do
			if( settings.EffectIcons[ effectId ] ~= nil ) then
				local path = settings.EffectIcons[ effectId ][ 1 ]
				if( settings.EffectIcons[ effectId ][ 2 ] ~= nil ) then
					path = settings.EffectIcons[ effectId ][ 2 ]	-- キャッシュを優先する
				end

				this.MT_Effects[ effectId ] = {}
				this.MT_Effects[ effectId ].Icon = Images.new( this:GetImageStyle(
					'icons/' .. path,
					24, 24,
					false	-- 初期ではドラッグ不可
				) )
				this.MT_Effects[ effectId ].Time = Texts.new( this:GetTextStyle( settings.TextStyle, 8, true ) )
				this.MT_Effects[ effectId ].Time:text( " " )
				this.MT_Effects[ effectId ].IconOffset = {}
				this.MT_Effects[ effectId ].TimeOffset = {}
				this.MT_Effects[ effectId ].Priority = -1
			end
		end

		-----------

		-- Arrow
		this.Arrow = Images.new( this:GetImageStyle(
			settings.ImagePaths.Arrow,
			settings.ArrowSize.Width, settings.ArrowSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-----------

		-- ST_Frame
		this.ST_Frame = Images.new( this:GetImageStyle(
			settings.ImagePaths.Frame,
			settings.STInfo.FrameSize.Width, settings.STInfo.FrameSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- ST_SideL
		this.ST_SideL = Images.new( this:GetImageStyle(
			settings.ImagePaths.SideL,
			settings.STInfo.SideSize.Width, settings.STInfo.SideSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- ST_SideR
		this.ST_SideR = Images.new( this:GetImageStyle(
			settings.ImagePaths.SideR,
			settings.STInfo.SideSize.Width, settings.STInfo.SideSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- ST_GaugeB
		this.ST_GaugeB = Images.new( this:GetImageStyle(
			settings.ImagePaths.Gauge,
			settings.STInfo.FrameSize.Width, settings.STInfo.FrameSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- ST_GaugeF
		this.ST_GaugeF = Images.new( this:GetImageStyle(
			settings.ImagePaths.Gauge,
			settings.STInfo.FrameSize.Width, settings.STInfo.FrameSize.Height,
			false	-- 初期ではドラッグ不可
		) )

		-- ST_Name
		this.ST_Name = Texts.new( this:GetTextStyle( settings.TextStyle, settings.STInfo.Name.Size, false ) )
		this.ST_Name:text( " " )

		-- ST_Health
		this.ST_Health = Texts.new( this:GetTextStyle( settings.TextStyle, settings.STInfo.Health.Size, true ) )
		this.ST_Health:text( " " )

		-- ST_Rank
		this.ST_Rank = Texts.new( this:GetTextStyle( settings.TextStyle, settings.STInfo.Rank.Size, true ) )
		this.ST_Rank:text( " " )

		-- アクションアイコン
		this.ST_Action = {}
		for i = 1, #settings.ActionIcons do
			this.ST_Action[ i ] = Images.new( this:GetImageStyle(
				settings.ActionIcons[ i ],
				16, 16,
				false	-- 初期ではドラッグ不可
			) )
		end

		-- ST_Level
		this.ST_Level = Texts.new( this:GetTextStyle( settings.TextStyle, settings.STInfo.Level.Size, true ) )
		this.ST_Level:text( " " )

		-- バフ効果アイコン
		for effectId =   0, 640 do
			if( settings.EffectIcons[ effectId ] ~= nil ) then
				local path = settings.EffectIcons[ effectId ][ 1 ]
				if( settings.EffectIcons[ effectId ][ 2 ] ~= nil ) then
					path = settings.EffectIcons[ effectId ][ 2 ]	-- キャッシュを優先する
				end

				this.ST_Effects[ effectId ] = {}
				this.ST_Effects[ effectId ].Icon = Images.new( this:GetImageStyle(
					'icons/' .. path,
					24, 24,
					false	-- 初期ではドラッグ不可
				) )
				this.ST_Effects[ effectId ].Time = Texts.new( this:GetTextStyle( settings.TextStyle, 8, true ) )
				this.ST_Effects[ effectId ].Time:text( " " )
				this.ST_Effects[ effectId ].IconOffset = {}
				this.ST_Effects[ effectId ].TimeOffset = {}
				this.ST_Effects[ effectId ].Priority = -1
			end
		end

		-----------

		-- Scanning
		this.Scanning = Texts.new( this:GetTextStyle( settings.TextStyle, 10, false) )
		this.Scanning:text( " " )
		this.Scanning:color( 255, 255, 255 )
		this.Scanning:alpha( 255 )
		this.Scanning:stroke_color(  50,  50,  50 )
		this.Scanning:stroke_alpha( 200 )
		this.Scanning:pos( 4, UIScreen.Height - 16 )

		-------------------------------------------------------

		-- 待ち時間を設定する
		this.isLoaded = false
		this.loadingWaitTime = os.clock()
	end,

	-- ロード完了確認
	IsLoaded = function( this )
		if( this.isLoaded == true ) then
			return true		-- ロード完了
		end

		if( ( os.clock() - this.loadingWaitTime ) <  0.1 ) then	-- 最低 0.5 秒は待つようにする
			return false	-- ロード中
		end

		-- 画像の指定サイズと実体サイズが異なるものをきちんと合わせる
		images =
		{
			this.MT_Frame, this.MT_SideL, this.MT_SideR, this.MT_GaugeB, this.MT_GaugeF,
			this.Arrow,
			this.ST_Frame, this.ST_SideL, this.ST_SideR, this.ST_GaugeB, this.ST_GaugeB,
		}
		for i = 1, #images do
			images[ i ]:size( images[ i ]:width(), images[ i ]:height() )
		end

		-- 画像の指定サイズと実体サイズが異なるものをきちんと合わせる
		for effectId, effect in pairs( this.MT_Effects ) do
			effect.Icon:size( effect.Icon:width(), effect.Icon:height() )
		end

		-- 画像の指定サイズと実体サイズが異なるものをきちんと合わせる
		for effectId, effect in pairs( this.ST_Effects ) do
			effect.Icon:size( effect.Icon:width(), effect.Icon:height() )
		end

		-- 画像の指定サイズと実体サイズが異なるものをきちんと合わせる
		for i = 1, #this.MT_Action do
			this.MT_Action[ i ]:size( this.MT_Action[ i ]:width(), this.MT_Action[ i ]:height() )
		end

		-- 画像の指定サイズと実体サイズが異なるものをきちんと合わせる
		for i = 1, #this.ST_Action do
			this.ST_Action[ i ]:size( this.ST_Action[ i ]:width(), this.ST_Action[ i ]:height() )
		end

		-- 解像度が変わっていたら位置をリセットする
		this:CheckResolution()

		-- 位置を反映する
		this:ApplyPosition()

		-- ロード完了
		this.isLoaded = true
	end,

	-- 解像度の変化を確認する
	CheckResolution = function( this )
		if( this.settings.UIScreen.Width ~= UIScreen.Width or this.settings.UIScreen.Height ~= UIScreen.Height ) then
			-- 解像度が変化したので位置をリセットする
			this.settings.UIScreen.Width  = UIScreen.Width
			this.settings.UIScreen.Height = UIScreen.Height
			this:ResetPosition()
			return false
		else
			return true
		end
	end,

	mtEffectTime = 0,

	-- メインターゲットゲージの状態を更新する
	ShowMT = function( this, name, rank, action, level, ratio, color, isSameTarget, effects )

		-- ターゲットのゲージを更新する
		local widthNew = math.floor( this.MT_Frame:width() * ratio / 100 )

		-- ApplyPositionで必要なのでcolorを保存しておく
		this.mtColor = color

		local x = this.MT_Frame:pos_x()

		if( isSameTarget == false ) then
			-- ターゲットが変わった場合
			this.MT_Frame:show()
			this.MT_SideL:show()
			this.MT_SideR:show()
			this.MT_GaugeB:show()	-- ゲージ：後
			this.MT_GaugeF:show()	-- ゲージ：前
			this.MT_Name:show()
	
			this.MT_GaugeB:width( widthNew )
			this.MT_GaugeF:width( widthNew )

			if( rank ~= nil and #rank >  0 ) then
				name = name .. ' ' .. rank
			end
			this.MT_Name:text( name )		-- 対象名

			if( color <  7 ) then
				this.MT_Name:pos_x( x + this.settings.MTInfo.Name.Offset.X )
				this.MT_Health:show()
				this.MT_Health:text( ratio .. '%' )
			else
				-- Object
				this.MT_Name:pos_x( x )
				this.MT_Health:hide()
			end

			-- ランクを設定(ノートリアスモンスター限定)
			if( rank ~= nil and #rank >  0 ) then
--				this.MT_Rank:show()
--				this.MT_Rank:text( rank )
				this.MT_Rank:hide()
			else
				this.MT_Rank:hide()
			end

			-- タイプを設定
			for i = 1, #this.MT_Action do
				if( i == action ) then
					this.MT_Action[ i ]:show()
				else
					this.MT_Action[ i ]:hide()
				end
			end
		else
			-- ターゲットが前フレームから変わっていない場合
			local widthOld = this.MT_GaugeB:width()

			if( widthNew <  widthOld ) then
				-- 減少
				local widthNow = widthOld - math.ceil( ( ( widthOld - widthNew ) * 0.05 ) )
				this.MT_GaugeB:width( widthNow )	-- 後(変化状態)
				this.MT_GaugeF:width( widthNew )	-- 前(最終状態)	
			elseif( widthNew >  widthOld ) then
				-- 増加
				local widthNow = widthOld + math.ceil( ( ( widthNew - widthOld ) * 0.05 ) )
				this.MT_GaugeB:width( widthNew )		-- 後(最終状態)
				this.MT_GaugeF:width( widthNow )		-- 前(変化状態)
			else
				this.MT_GaugeB:width( widthNew )		-- 後(最終状態)
				this.MT_GaugeF:width( widthNew )		-- 前(変化状態)
			end
		end

		if( color <  7 ) then
			this.MT_Health:text( ratio .. '%' )
		end

		-- 色を設定する
		this:SetColor(
			{ this.MT_Frame, this.MT_SideL, this.MT_SideR, this.MT_GaugeB, this.MT_GaugeF },
			{ this.MT_Name, this.MT_Health, this.MT_Rank, this.MT_Level },
			color,
			this.MTColors
		)

		-- レベルはターゲット中にも表示されるようになる可能性があるため毎フレーム描画
		if( level ~= nil ) then
			this.MT_Level:show()
			this.MT_Level:text( "Lv " .. level )
		else
			this.MT_Level:hide()
		end

		-------------------------------------------------------
		-- バフ効果を表示する(ターゲットが変わっていなくても毎フレーム必要)

		if( isSameTarget == false ) then this.mtEffectTime = 0 end

		if( this.mtEffectTime == 0 or  ( this.mtEffectTime >  0 and ( os.clock() - this.mtEffectTime ) >= 0.1 ) ) then 

			-- 一旦全てのバフ効果を非表示にする
			for effectId, effectUI in pairs( this.MT_Effects ) do
				effectUI.Priority = -1
			end

			-- 有効なバフのみ表示する
			if( effects ~= nil ) then
				local bx, by = this.MT_Frame:pos()
				local ox =  0

				local category = 0
				local priority = 0
				for _, effect in pairs( effects ) do
					local effectUI = this.MT_Effects[ effect.EffectId ]

					-- カテゴリが強化から弱化に変わった場合にスペースを空ける
					if( category == 0 ) then
						category = effect.Category
					elseif( category ~= effect.Category ) then
						category = effect.Category
						ox = ox + 8		-- 効果が強化から弱化に変わる際にスペースを空ける
					end

					effectUI.Icon:show()
					effectUI.Icon:alpha( 255 )	-- 点滅が起こると変わっているので強制不透明化する
					effectUI.IconOffset.X = ox
					effectUI.IconOffset.Y = 10
					effectUI.Icon:pos( bx + ox, by + effectUI.IconOffset.Y )

					if( effect.EndTime >  0 ) then
						local tv = effect.EndTime - os.clock()
						if( tv >= 0 ) then
							effectUI.Time:show()
							effectUI.Time:alpha( 255 )

							local ts
							local tx = 0
							if( tv >= 3600 ) then
								ts = tostring( math.floor( tv / 3600 ) ) .. 'h'
								tx = - ( ( 24 - ( #ts * 12 ) ) / 2 )
							elseif( tv >= 60 ) then
								ts = tostring( math.floor( tv / 60 ) ) .. 'm'
								tx = - ( ( 24 - ( #ts * 12 ) ) / 2 )
							else
								ts = tostring( math.floor( tv ) )
								tx = - ( ( 24 - ( #ts * 12 ) ) / 2 )
								if( #ts == 2 ) then tx = tx - 1 end
								if( #ts == 1 ) then tx = tx + 2 end
							end
							effectUI.Time:text( ts )
							effectUI.TimeOffset.X = ox + 24 + tx
							effectUI.TimeOffset.Y = 10 + 22
							effectUI.Time:pos( - ( UIScreen.Width - ( bx + effectUI.TimeOffset.X ) ), by + effectUI.TimeOffset.Y )
						else
							-- アイコンを点滅させる
							effectUI.Time:hide()

							tv = ( - tv % 0.5 ) * 2
							if( tv >= 0.5 ) then tv = 1 - tv end
							tv = tv * 2
							effectUI.Icon:alpha( 255 * ( 1 - tv ) )
						end
					else
						effectUI.Time:hide()
					end

					ox = ox + 28

					effectUI.Priority = priority
					priority = priority + 1
				end
			end

			for effectId, effectUI in pairs( this.MT_Effects ) do
				if( effectUI.Priority <  0 ) then
					effectUI.Icon:hide()
					effectUI.Time:hide()
				end
			end

			-- 0.1 秒ごとの更新にする
			this.mtEffectTime = os.clock()
		end

		
	end,

	stEffectTime = 0,

	-- サブターゲットゲージの状態を更新する
	ShowST = function( this, name, rank, action, level, ratio, color, isSameTarget, effects )

		-- ターゲットのゲージを更新する
		local widthNew = math.floor( this.ST_Frame:width() * ratio / 100 )

		this.stColor = color

		local x = this.ST_Frame:pos_x()

		if( isSameTarget == false ) then
			-- ターゲットが変わった場合
			this.Arrow:show()		-- ターゲットのターゲット(サブターゲット)の矢印

			this.ST_Frame:show()	-- 下地
			this.ST_SideL:show()	-- 左端
			this.ST_SideR:show()	-- 右端
			this.ST_GaugeB:show()	-- 棒後
			this.ST_GaugeF:show()	-- 棒前
			this.ST_Name:show()		-- 名前

			this.ST_GaugeB:width( widthNew )
			this.ST_GaugeF:width( widthNew )

			if( rank ~= nil and #rank >  0 ) then
				name = name .. ' ' .. rank
			end
			this.ST_Name:text( name )		-- 対象名

			if( color <  7 ) then
				this.ST_Name:pos_x( x + this.settings.STInfo.Name.Offset.X )
				this.ST_Health:show()
				this.ST_Health:text( ratio .. '%' )
			else
				-- Object
				this.ST_Name:pos_x( x )
				this.ST_Health:hide()
			end

			-- ランクを設定(ノートリアスモンスター限定)
			if( rank ~= nil and #rank >  0 ) then
--				this.ST_Rank:show()
--				this.ST_Rank:text( rank )
				this.ST_Rank:hide()
			else
				this.ST_Rank:hide()
			end

			-- タイプを設定
			for i = 1, #this.ST_Action do
				if( i == action ) then
					this.ST_Action[ i ]:show()
				else
					this.ST_Action[ i ]:hide()
				end
			end
		else
			-- ターゲットが前フレームから変わっていない場合
			local widthOld = this.ST_GaugeB:width()

			if( widthNew <  widthOld ) then
				-- 減少
				local widthNow = widthOld - math.ceil( ( ( widthOld - widthNew ) * 0.05 ) )
				this.ST_GaugeB:width( widthNow )	-- 後(変化状態)
				this.ST_GaugeF:width( widthNew )	-- 前(最終状態)
			elseif( widthNew >  widthOld ) then
				-- 増加
				local widthNow = widthOld + math.ceil( ( ( widthNew - widthOld ) * 0.05 ) )
				this.ST_GaugeB:width( widthNew )		-- 後(最終状態)
				this.ST_GaugeF:width( widthNow )		-- 前(変化状態)
			else
				this.ST_GaugeB:width( widthNew )		-- 後(最終状態)
				this.ST_GaugeF:width( widthNew )		-- 前(変化状態)
			end
		end
				
		if( color <  7 ) then
			this.ST_Health:text( ratio .. '%' )
		end

		-- 色を設定する
		this:SetColor(
			{ this.Arrow, this.ST_Frame, this.ST_SideL, this.ST_SideR, this.ST_GaugeB, this.ST_GaugeF },
			{ this.ST_Name, this.ST_Health, this.ST_Rank, this.ST_Level },
			color,
			this.STColors
		)

		-- レベルはターゲット中にも表示されるようになる可能性があるため毎フレーム描画
		if( level ~= nil) then
			this.ST_Level:show()
			this.ST_Level:text( "Lv " .. level )
		else
			this.ST_Level:hide()
		end

		-------------------------------------------------------
		-- バフ効果を表示する(ターゲットが変わっていなくても毎フレーム必要)

		if( isSameTarget == false ) then this.stEffectTime = 0 end

		if( this.stEffectTime == 0 or  ( this.stEffectTime >  0 and ( os.clock() - this.stEffectTime ) >= 0.1 ) ) then 

			-- 一旦全てのバフ効果を非表示にする
			for effectId, effectUI in pairs( this.ST_Effects ) do
				effectUI.Priority = -1
			end

			-- 有効なバフのみ表示する
			if( effects ~= nil ) then
				local bx, by = this.ST_Frame:pos()
				local ox = 0

				local category = 0
				local priority = 0
				for _, effect in pairs( effects ) do
					local effectUI = this.ST_Effects[ effect.EffectId ]

					if( category == 0 ) then
						category = effect.Category
					elseif( category ~= effect.Category ) then
						category = effect.Category
						ox = ox + 8		-- 効果が強化から弱化に変わる際にスペースを空ける
					end

					effectUI.Icon:show()
					effectUI.Icon:alpha( 255 )	-- 点滅が起こると変わっているので強制不透明化する
					effectUI.IconOffset.X = ox
					effectUI.IconOffset.Y = 10
					effectUI.Icon:pos( bx + ox, by + effectUI.IconOffset.Y )

					if( effect.EndTime >  0 ) then
						local tv = effect.EndTime - os.clock()
						if( tv >= 0 ) then
							effectUI.Time:show()
							effectUI.Time:alpha( 255 )

							local ts = ''
							local tx = 0
							if( tv >= 3600 ) then
								ts = tostring( math.floor( tv / 3600 ) ) .. 'h'
								tx = - ( ( 24 - ( #ts * 12 ) ) / 2 )
							elseif( tv >= 60 ) then
								ts = tostring( math.floor( tv / 60 ) ) .. 'm'
								tx = - ( ( 24 - ( #ts * 12 ) ) / 2 )
							else
								ts = tostring( math.floor( tv ) )
								tx = - ( ( 24 - ( #ts * 12 ) ) / 2 )
								if( #ts == 2 ) then tx = tx - 1 end
								if( #ts == 1 ) then tx = tx + 2 end
							end
							effectUI.Time:text( ts )
							effectUI.TimeOffset.X = ox + 24 + tx
							effectUI.TimeOffset.Y = 10 + 22
							effectUI.Time:pos( - ( UIScreen.Width - ( bx + effectUI.TimeOffset.X ) ), by + effectUI.TimeOffset.Y )
						else
							-- アイコンを点滅させる
							effectUI.Time:hide()

							tv = ( - tv % 0.5 ) * 2
							if( tv >= 0.5 ) then tv = 1 - tv end
							tv = tv * 2
							effectUI.Icon:alpha( 255 * ( 1 - tv ) )
						end
					else
						effectUI.Time:hide()
					end

					ox = ox + 28

					effectUI.Priority = priority
					priority = priority + 1
				end
			end

			for effectId, effectUI in pairs( this.ST_Effects ) do
				if( effectUI.Priority <  0 ) then
					effectUI.Icon:hide()
					effectUI.Time:hide()
				end
			end

			-- 0.1 秒ごとの更新にする
			this.stEffectTime = os.clock()
		end
	end,

	Hide = function( this )
		this:HideMT()
		this:HideST()
	end,

	-- 関数:メインターゲットゲージを消去する
	HideMT = function( this )
		this.mtColor = 0

		this.MT_Frame:hide()
		this.MT_SideL:hide()
		this.MT_SideR:hide()
		this.MT_GaugeB:hide()
		this.MT_GaugeF:hide()

		this.MT_Name:hide()
		this.MT_Health:hide()

		this.MT_Rank:hide()

		-- 一旦全てのタイプを非表示にする
		for i = 1, #this.MT_Action do
			this.MT_Action[ i ]:hide()
		end

		this.MT_Level:hide()

		-- 一旦全てのバフ効果を非表示にする
		for effectId, effect in pairs( this.MT_Effects ) do
			effect.Icon:hide()
			effect.Time:hide()
		end
	end,

	-- 関数:サブターゲットゲージを消去する
	HideST = function( this )
		this.stColor = 0

		this.Arrow:hide()

		this.ST_SideL:hide()
		this.ST_SideR:hide()
		this.ST_Frame:hide()
		this.ST_GaugeB:hide()
		this.ST_GaugeF:hide()

		this.ST_Name:hide()
		this.ST_Health:hide()

		this.ST_Rank:hide()

		-- 一旦全てのタイプを非表示にする
		for i = 1, #this.ST_Action do
			this.ST_Action[ i ]:hide()
		end

		this.ST_Level:hide()

		-- 一旦全てのバフ効果を非表示にする
		for effectId, effect in pairs( this.ST_Effects ) do
			effect.Icon:hide()
			effect.Time:hide()
		end
	end,

	-- 各パーツの色を設定する
	SetColor = function( this, images, texts, color, colors )
		local c

		for i = 1, #images do
			c = colors[ color ][ i ]
			images[ i ]:color( c[ 1 ], c[ 2 ], c[ 3 ] )
		end

		local l = #colors
		for i = 1, #texts do
			-- 最後は StrokeColor
			c = colors[ color ][ l - 1 ]
			texts[ i ]:color( c[ 1 ], c[ 2 ], c[ 3 ] )
			c = colors[ color ][ l - 0 ]
			texts[ i ]:stroke_color( c[ 1 ], c[ 2 ], c[ 3 ] )
			texts[ i ]:stroke_alpha( c[ 4 ] )
		end
	end,

	-- スキャン中の表示を行う
	ShowScanning = function( this, time )
		this.Scanning:show()
		local p = math.floor( time / 0.25 ) % 4

		local dot = { "", ".", "..", "..." }
		this.Scanning:text( "Scanning" .. dot[ p + 1 ] )
	end,

	HideScanning = function( this )
		this.Scanning:hide()
	end,

	-----------------------------------------------------------

	-- 位置を初期化する
	ResetPosition = function( this )
		this.settings.Offset.X = 0
		this.settings.Offset.Y = 0
	end,

	-- 位置の反映を行う
	ApplyPosition = function( this )
		local w = this.MT_Frame:width()
		local h = this.MT_Frame:height()

		local baseX, baseY = this:GetBasePosition( w, h )

		-- Offset にはドラッグを反映させた値が入っている(ドラッグしていない場合は初期状態で座標が設定されていない事に注意する)
		local x = baseX + this.settings.Offset.X
		local y = baseY + this.settings.Offset.Y

		-------------------------------

		-- MT
		this.MT_Frame:pos( x, y )
		this.MT_SideL:pos( x - this.MT_SideL:width(), y + ( ( h - this.MT_SideL:height() ) / 2 ) )
		this.MT_SideR:pos( x + w,                     y + ( ( h - this.MT_SideR:height() ) / 2 ) )
		this.MT_GaugeB:pos( x, y )
		this.MT_GaugeF:pos( x, y )

		if( this.mtColor <  6 ) then
			-- NPC以外
			this.MT_Name:pos( x + this.settings.MTInfo.Name.Offset.X, y + this.settings.MTInfo.Name.Offset.Y )
			this.MT_Health:pos( - ( UIScreen.Width - ( x + this.settings.MTInfo.Health.Offset.X ) ), y + this.settings.MTInfo.Health.Offset.Y )
		else
			-- NPC
			this.MT_Name:pos( x, y + this.settings.MTInfo.Name.Offset.Y )
			this.MT_Health:pos( - ( UIScreen.Width - ( x + this.settings.MTInfo.Health.Offset.X ) ), y + this.settings.MTInfo.Health.Offset.Y )
		end

		this.MT_Rank:pos( - ( UIScreen.Width - ( x + this.settings.MTInfo.FrameSize.Width + this.settings.MTInfo.Rank.Offset.X ) ), y + this.settings.MTInfo.Rank.Offset.Y )

		for i = 1, #this.MT_Action do
			this.MT_Action[ i ]:pos( x + this.settings.MTInfo.FrameSize.Width + this.settings.MTInfo.Action.Offset.X, y + this.settings.MTInfo.Action.Offset.Y )
		end

		this.MT_Level:pos( - ( UIScreen.Width - ( x + this.settings.MTInfo.FrameSize.Width + this.settings.MTInfo.Level.Offset.X ) ), y + this.settings.MTInfo.Level.Offset.Y )

		-- メインのバフ
		for effectId, effect in pairs( this.MT_Effects ) do
			if( effect.Priority >= 0 ) then
				effect.Icon:pos( x + effect.IconOffset.X, y + effect.IconOffset.Y )
				effect.Time:pos( - ( UIScreen.Width - ( x + effect.TimeOffset.X ) ), y + effect.TimeOffset.Y )
			end
		end

		-------------------------------

		x = x + this.settings.STInfo.Offset.X
		y = y + this.settings.STInfo.Offset.Y

		-- Arrow
		this.Arrow:pos( x - 8 - this.settings.ArrowSize.Width, y - 3 )

		local w = this.ST_Frame:width()
		local h = this.ST_Frame:height()

		-------------------------------

		-- ST
		this.ST_Frame:pos( x, y )
		this.ST_SideL:pos( x - this.ST_SideL:width(), y + ( ( h - this.ST_SideL:height() ) / 2 ) )
		this.ST_SideR:pos( x + w,                     y + ( ( h - this.ST_SideR:height() ) / 2 ) )
		this.ST_GaugeB:pos( x, y )
		this.ST_GaugeF:pos( x, y )

		if( this.stColor <  6 ) then
			-- NPC以外
			this.ST_Name:pos( x + this.settings.STInfo.Name.Offset.X, y + this.settings.STInfo.Name.Offset.Y )
			this.ST_Health:pos( - ( UIScreen.Width - ( x + this.settings.STInfo.Health.Offset.X ) ), y + this.settings.STInfo.Health.Offset.Y )
		else
			-- NPC
			this.ST_Name:pos( x, y + this.settings.STInfo.Name.Offset.Y )
			this.ST_Health:pos( - ( UIScreen.Width - ( x + this.settings.STInfo.Health.Offset.X ) ), y + this.settings.STInfo.Health.Offset.Y )
		end

		this.ST_Rank:pos( - ( UIScreen.Width - ( x + this.settings.STInfo.FrameSize.Width + this.settings.STInfo.Rank.Offset.X ) ), y + this.settings.STInfo.Rank.Offset.Y )

		for i = 1, #this.ST_Action do
			this.ST_Action[ i ]:pos( x + this.settings.STInfo.FrameSize.Width + this.settings.STInfo.Action.Offset.X, y + this.settings.STInfo.Action.Offset.Y )
		end

		this.ST_Level:pos( - ( UIScreen.Width - ( x + this.settings.STInfo.FrameSize.Width + this.settings.STInfo.Level.Offset.X ) ), y + this.settings.STInfo.Level.Offset.Y )

		-- サブのバフ
		for effectId, effect in pairs( this.ST_Effects ) do
			if( effect.Priority >= 0 ) then
				effect.Icon:pos( x + effect.IconOffset.X, y + effect.IconOffset.Y )
				effect.Time:pos( - ( UIScreen.Width - ( x + effect.TimeOffset.X ) ), y + effect.TimeOffset.Y )
			end
		end
	end,

	-- Anchor Pivot からなる基準位置を取得する
	GetBasePosition = function( this, width, height )
		local baseX = UIScreen.Width  * this.settings.Anchor.X - width  * this.settings.Pivot.X
		local baseY = UIScreen.Height * this.settings.Anchor.Y - height * this.settings.Pivot.Y
		return baseX, baseY
	end,

	-----------------------------------------------------------

	-- ドラッグの設定を行う
	SetDraggable = function( this, state )
		this.settings.Draggable = state
		this.MT_Frame:draggable( state )
	end,

	isDragging = false,
	draggingPosition = { X = 0, Y = 0 },
	
	-- ドラッグ処理
	ProcessDragging = function( this, state )
		if( state == 1 ) then
			this.isDragging = true	-- ドラッグ中
			this.draggingPosition.X, this.draggingPosition.Y = this.MT_Frame:pos()
		elseif( state == 2 ) then
			this.isDragging = false	-- ドラッグ終了

			-- 位置に変化があった時に true を返す
			local x, y = this.MT_Frame:pos()
			if( x ~= this.draggingPosition.X or y ~= this.draggingPosition.Y ) then
				return true
			end
		end

		if( this.isDragging == true ) then
			-- ドラッグ中はオフセット値を更新する
			local x, y = this.MT_Frame:pos()
			if( x ~= this.draggingPosition.X or y ~= this.draggingPosition.Y ) then
				local w = this.MT_Frame:width()
				local h = this.MT_Frame:height()
				local baseX, baseY = this:GetBasePosition( w, h )
				this.settings.Offset.X = x - baseX
				this.settings.Offset.Y = y - baseY
				this:ApplyPosition()	-- 表示に反映させる
			end
		end

		return false
	end,

	-----------------------------------------------------------

	-- ターゲットの種類ごとの表示色
	MTColors =
	{
		{	-- PC
			{   0, 100, 166 },	-- MTFrame
			{   0, 100, 166 },	-- MTSideL
			{   0, 100, 166 },	-- MTSideR
			{ 123, 189, 205 },	-- MTGaugeB
			{ 163, 209, 245 },	-- MTGaugeF
			{ 255, 255, 255 },	-- MT_Name
			{  50,  50,  50, 200 }	-- MT_Name_Stroke
		},
		{	-- Party
			{  52, 200, 200 },
			{  52, 200, 200 },
			{  52, 200, 200 },
			{  88, 215, 215 },
			{ 128, 255, 255 },
			{ 201, 255, 255 },
			{  38,  43,  46, 200 }
		},
		{	-- Enemy(Normal)
			{ 181, 131,  59 },
			{ 181, 131,  59 },
			{ 181, 131,  59 },
			{ 212, 192, 126 },
			{ 252, 232, 166 },
			{ 255, 255, 193 },
			{  51,  47,  38, 200 }
		},
		{	-- Enemy(Battle)
			{ 255,  64,  65 },
			{ 255,  64,  65 },
			{ 255,  64,  65 },
			{ 215,  63,  87 },
			{ 255, 103, 127 },
			{ 255, 143, 138 },
			{  49,  17,  19, 200 }
		},
		{	-- Enemy(Apathy)
			{  81,  80, 178 },
			{  81,  80, 178 },
			{  81,  80, 178 },
			{  81,  80, 178 },
			{ 245, 122, 245 },
			{ 255, 132, 255 },
			{  44,  19,  44, 200 }
		},
		{	-- NPC
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  56, 201,  88 },
			{ 200, 255, 200 },
			{  33,  39,  29, 200 }
		},
		{	-- Object
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  56, 201,  88 },
			{ 200, 255, 200 },
			{  33,  39,  29, 200 }
		},
	},

	STColors =
	{
		{	-- PC
			{   0, 100, 166 },	-- MTFrame
			{   0, 100, 166 },	-- MTSideL
			{   0, 100, 166 },	-- MTSideR
			{ 123, 189, 205 },	-- MTGaugeB
			{ 163, 209, 245 },	-- MTGaugeF
			{ 255, 255, 255 },	-- MT_Name
			{  50,  50,  50, 200 }	-- MT_Name_Stroke
		},
		{	-- Party
			{  52, 200, 200 },
			{  52, 200, 200 },
			{  52, 200, 200 },
			{  88, 215, 215 },
			{ 128, 255, 255 },
			{ 201, 255, 255 },
			{  38,  43,  46, 200 }
		},
		{	-- Enemy(Normal)
			{ 181, 131,  59 },
			{ 181, 131,  59 },
			{ 181, 131,  59 },
			{ 212, 192, 126 },
			{ 252, 232, 166 },
			{ 255, 255, 193 },
			{  51,  47,  38, 200 }
		},
		{	-- Enemy(Battle)
			{ 255,  64,  65 },
			{ 255,  64,  65 },
			{ 255,  64,  65 },
			{ 215,  63,  87 },
			{ 255, 103, 127 },
			{ 255, 143, 138 },
			{  49,  17,  19, 200 }
		},
		{	-- Enemy(Apathy)
			{  81,  80, 178 },
			{  81,  80, 178 },
			{  81,  80, 178 },
			{  81,  80, 178 },
			{ 245, 122, 245 },
			{ 255, 132, 255 },
			{  44,  19,  44, 200 }
		},
		{	-- NPC
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  56, 201,  88 },
			{ 200, 255, 200 },
			{  33,  39,  29, 200 }
		},
		{	-- Object
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  26, 151,  58 },
			{  56, 201,  88 },
			{ 200, 255, 200 },
			{  33,  39,  29, 200 }
		},
	},
}

return ui
