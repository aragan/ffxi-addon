	-- 魔法による基本効果時間
local Spells =
{
	[    1 ] = {},					-- ケアル
	[    2 ] = {},					-- ケアルⅡ
	[    3 ] = {},					-- ケアルⅢ
	[    4 ] = {},					-- ケアルⅣ
	[    5 ] = {},					-- ケアルⅤ
	[    6 ] = {},					-- ケアルⅥ
	[    7 ] = {},					-- ケアルガ
	[    8 ] = {},					-- ケアルガⅡ
	[    9 ] = {},					-- ケアルガⅢ
	[   10 ] = {},					-- ケアルガⅣ
	[   11 ] = {},					-- ケアルガⅤ
	[   12 ] = {},					-- レイズ
	[   13 ] = {},					-- レイズⅡ
	[   14 ] = {},					-- ポイゾナ
	[   15 ] = {},					-- パラナ
	[   16 ] = {},					-- ブライナ
	[   17 ] = {},					-- サイレナ
	[   18 ] = {},					-- ストナ
	[   19 ] = {},					-- ウィルナ
	[   20 ] = {},					-- カーズナ
	[   21 ] = {},					-- ホーリー
	[   22 ] = {},					-- ホーリーⅡ

	[   23 ] = { 134,   60 },		-- ディア
	[   24 ] = { 134,  120 },		-- ディアⅡ
	[   25 ] = { 134,  180 },		-- ディアⅢ
	[   26 ] = { 134,  240 },		-- ディアⅣ
	[   27 ] = { 134,  300 },		-- ディアⅤ

	[   28 ] = {},					-- バニシュ
	[   29 ] = {},					-- バニシュⅡ
	[   30 ] = {},					-- バニシュⅢ
	[   31 ] = {},					-- バニシュⅣ
	[   32 ] = {},					-- バニシュⅤ

	[   33 ] = { 134,   60 },		-- ディアガ
	[   34 ] = { 134,  120 },		-- ディアガⅡ
	[   35 ] = { 134,  180 },		-- ディアガⅢ
	[   36 ] = { 134,  240 },		-- ディアガⅣ
	[   37 ] = { 134,  300 },		-- ディアガⅤ

	[   38 ] = {},					-- バニシュガ
	[   39 ] = {},					-- バニシュガⅡ
	[   40 ] = {},					-- バニシュガⅢ
	[   41 ] = {},					-- バニシュガⅣ
	[   42 ] = {},					-- バニシュガⅤ

	[   43 ] = {  40, 1800 },		-- プロテス
	[   44 ] = {  40, 1800 },		-- プロテスⅡ
	[   45 ] = {  40, 1800 },		-- プロテスⅢ
	[   46 ] = {  40, 1800 },		-- プロテスⅣ
	[   47 ] = {  40, 1800 },		-- プロテスⅤ

	[   48 ] = {  41, 1800 },		-- シェル
	[   49 ] = {  41, 1800 },		-- シェルⅡ
	[   50 ] = {  41, 1800 },		-- シェルⅢ
	[   51 ] = {  41, 1800 },		-- シェルⅣ
	[   52 ] = {  41, 1800 },		-- シェルⅤ

	[   53 ] = {  36,  300 },		-- ブリンク
	[   54 ] = {  37,  300 },		-- ストンスキン
	[   55 ] = {  39,  600 },		-- アクアベール

	[   56 ] = {  13,  180 },		-- スロウ
	[   57 ] = {  33,  180 },		-- ヘイスト

	[   58 ] = {   4,  180 },		-- パライズ
	[   59 ] = {   6,  120 },		-- サイレス

	[   60 ] = { 100,  480 },		-- バファイ
	[   61 ] = { 101,  480 },		-- バブリザ
	[   62 ] = { 102,  480 },		-- バエアロ
	[   63 ] = { 103,  480 },		-- バストン
	[   64 ] = { 104,  480 },		-- バサンダ
	[   65 ] = { 105,  480 },		-- バウォタ
	[   66 ] = { 100,  480 },		-- バファイラ
	[   67 ] = { 101,  480 },		-- バブリザラ
	[   68 ] = { 102,  480 },		-- バエアロラ
	[   69 ] = { 103,  480 },		-- バストンラ
	[   70 ] = { 104,  480 },		-- バサンダラ
	[   71 ] = { 105,  480 },		-- バウォタラ
	[   72 ] = { 106,  480 },		-- バスリプル
	[   73 ] = { 107,  480 },		-- バポイズン
	[   74 ] = { 108,  480 },		-- バパライズ
	[   75 ] = { 109,  480 },		-- バブライン
	[   76 ] = { 110,  480 },		-- バサイレス
	[   77 ] = { 111,  480 },		-- バブレイク
	[   78 ] = { 112,  480 },		-- バウィルス

	[   79 ] = {  13,  180 },		-- スロウⅡ
	[   80 ] = {   4,  120 },		-- パライズⅡ

	[   81 ] = {},					-- リコールジャグ
	[   82 ] = {},					-- リコールパシュ
	[   83 ] = {},					-- リコールメリファ
	
	[   84 ] = { 286,  480 },		-- バアムネジア
	[   85 ] = { 286,  480 },		-- バアムネジラ
	[   86 ] = { 106,  480 },		-- バスリプラ
	[   87 ] = { 107,  480 },		-- バポイゾラ
	[   88 ] = { 108,  480 },		-- バパライラ
	[   89 ] = { 109,  480 },		-- バブライラ
	[   90 ] = { 110,  480 },		-- バサイレラ
	[   91 ] = { 111,  480 },		-- バブレクラ
	[   92 ] = { 112,  480 },		-- バウィルラ

	[   93 ] = {},					-- ケアルラ
	[   94 ] = nil,					-- サクリファイス
	[   95 ] = {},					-- エスナ

	[   96 ] = { 275,  180 },		-- オースピス
	[   97 ] = { 403,   60 },		-- リアクト
	[   98 ] = {   2,   90 },		-- リポーズ

	[   99 ] = { 181,  180 },		-- 砂塵の陣

	[  100 ] = {  94,  180 },		-- エンファイア
	[  101 ] = {  95,  180 },		-- エンブリザド
	[  102 ] = {  96,  180 },		-- エンエアロ
	[  103 ] = {  97,  180 },		-- エンストーン
	[  104 ] = {  98,  180 },		-- エンサンダー
	[  105 ] = {  99,  180 },		-- エンウォータ

	[  106 ] = { 116,  180 },		-- ファランクス
	[  107 ] = { 116,  240 },		-- ファランクスⅡ

	[  108 ] = {  42,   75 },		-- リジェネ
	[  109 ] = {  43,  150 },		-- リフレシュ

	[  110 ] = {  42,   60 },		-- リジェネⅡ
	[  111 ] = {  42,   60 },		-- リジェネⅢ

	[  112 ] = { 156,   12 },		-- フラッシュ

	[  113 ] = { 183,  180 },		-- 豪雨の陣
	[  114 ] = { 180,  180 },		-- 烈風の陣
	[  115 ] = { 178,  180 },		-- 熱波の陣
	[  116 ] = { 179,  180 },		-- 吹雪の陣
	[  117 ] = { 182,  180 },		-- 疾雷の陣
	[  118 ] = { 185,  180 },		-- 妖霧の陣
	[  119 ] = { 184,  180 },		-- 極光の陣

	[  120 ] = {},					-- テレポヨト
	[  121 ] = {},					-- テレポルテ
	[  122 ] = {},					-- テレポホラ
	[  123 ] = {},					-- テレポデム
	[  124 ] = {},					-- テレポメア

	[  125 ] = {  40, 1800 },		-- プロテア
	[  126 ] = {  40, 1800 },		-- プロテアⅡ
	[  127 ] = {  40, 1800 },		-- プロテアⅢ
	[  128 ] = {  40, 1800 },		-- プロテアⅣ
	[  129 ] = {  40, 1800 },		-- プロテアⅤ

	[  130 ] = {  41, 1800 },		-- シェルラ
	[  131 ] = {  41, 1800 },		-- シェルラⅡ
	[  132 ] = {  41, 1800 },		-- シェルラⅢ
	[  133 ] = {  41, 1800 },		-- シェルラⅣ
	[  134 ] = {  41, 1800 },		-- シェルラⅤ

	[  135 ] = { 113, 3600 },		-- リレイズ
	[  136 ] = {  69,  180 },		-- インビジ
	[  137 ] = {  71,  480 },		-- スニーク
	[  138 ] = {  70,  480 },		-- デオード

	[  139 ] = {},					-- テレポヴァズ
	[  140 ] = nil,					-- レイズⅢ

	[  141 ] = { 113, 3600 },		-- リレイズⅡ
	[  142 ] = { 113, 3600 },		-- リレイズⅢ

	[  143 ] = {},					-- イレース

	[  144 ] = {},					-- ファイア
	[  145 ] = {},					-- ファイアⅡ
	[  146 ] = {},					-- ファイアⅢ
	[  147 ] = {},					-- ファイアⅣ
	[  148 ] = {},					-- ファイアⅤ
	[  149 ] = {},					-- ブリザド
	[  150 ] = {},					-- ブリザドⅡ
	[  151 ] = {},					-- ブリザドⅢ
	[  152 ] = {},					-- ブリザドⅣ
	[  153 ] = {},					-- ブリザドⅤ
	[  154 ] = {},					-- エアロ
	[  155 ] = {},					-- エアロⅡ
	[  156 ] = {},					-- エアロⅢ
	[  157 ] = {},					-- エアロⅣ
	[  158 ] = {},					-- エアロⅤ
	[  159 ] = {},					-- ストーン
	[  160 ] = {},					-- ストーンⅡ
	[  161 ] = {},					-- ストーンⅢ
	[  162 ] = {},					-- ストーンⅣ
	[  163 ] = {},					-- ストーンⅤ
	[  164 ] = {},					-- サンダー
	[  165 ] = {},					-- サンダーⅡ
	[  166 ] = {},					-- サンダーⅢ
	[  167 ] = {},					-- サンダーⅣ
	[  168 ] = {},					-- サンダーⅤ
	[  169 ] = {},					-- ウォータ
	[  170 ] = {},					-- ウォータⅡ
	[  171 ] = {},					-- ウォータⅢ
	[  172 ] = {},					-- ウォータⅣ
	[  173 ] = {},					-- ウォータⅤ
	[  174 ] = {},					-- ファイガ
	[  175 ] = {},					-- ファイガⅡ
	[  176 ] = {},					-- ファイガⅢ
	[  177 ] = {},					-- ファイガⅣ
	[  178 ] = {},					-- ファイガⅤ
	[  179 ] = {},					-- ブリザガ
	[  180 ] = {},					-- ブリザガⅡ
	[  181 ] = {},					-- ブリザガⅢ
	[  182 ] = {},					-- ブリザガⅣ
	[  183 ] = {},					-- ブリザガⅤ
	[  184 ] = {},					-- エアロガ
	[  185 ] = {},					-- エアロガⅡ
	[  186 ] = {},					-- エアロガⅢ
	[  187 ] = {},					-- エアロガⅣ
	[  188 ] = {},					-- エアロガⅤ
	[  189 ] = {},					-- ストンガ
	[  190 ] = {},					-- ストンガⅡ
	[  191 ] = {},					-- ストンガⅢ
	[  192 ] = {},					-- ストンガⅣ
	[  193 ] = {},					-- ストンガⅤ
	[  194 ] = {},					-- サンダガ
	[  195 ] = {},					-- サンダガⅡ
	[  196 ] = {},					-- サンダガⅢ
	[  197 ] = {},					-- サンダガⅣ
	[  198 ] = {},					-- サンダガⅤ
	[  199 ] = {},					-- ウォタガ
	[  200 ] = {},					-- ウォタガⅡ
	[  201 ] = {},					-- ウォタガⅢ
	[  202 ] = {},					-- ウォタガⅣ
	[  203 ] = {},					-- ウォタガⅤ
	[  204 ] = { 633,   15 },		-- フレア
	[  205 ] = nil,					-- フレアⅡ
	[  206 ] = { 628,   15 },		-- フリーズ
	[  207 ] = nil,					-- フリーズⅡ
	[  208 ] = { 629,   15 },		-- トルネド
	[  209 ] = nil,					-- トルネドⅡ
	[  210 ] = { 630,   15 },		-- クエイク
	[  211 ] = nil,					-- クエイクⅡ
	[  212 ] = { 631,   15 },		-- バースト
	[  213 ] = nil,					-- バーストⅡ
	[  214 ] = { 632,   15 },		-- フラッド
	[  215 ] = nil,					-- フラッドⅡ

	[  216 ] = {  12,   75 },		-- グラビデ
	[  217 ] = {  12,   90 },		-- グラビデⅡ

	[  218 ] = {},					-- メテオ
	[  219 ] = nil,					-- コメット

	[  220 ] = {   3,   90 },		-- ポイズン
	[  221 ] = {   3,  120 },		-- ポイズンⅡ
	[  222 ] = {   3,  150 },		-- ポイズンⅢ
	[  223 ] = {   3,  180 },		-- ポイズンⅣ
	[  224 ] = {   3,  210 },		-- ポイズンⅤ

	[  225 ] = {   3,   90 },		-- ポイゾガ
	[  226 ] = {   3,  120 },		-- ポイゾガⅡ
	[  227 ] = {   3,  150 },		-- ポイゾガⅢ
	[  228 ] = {   3,  180 },		-- ポイゾガⅣ
	[  229 ] = {   3,  210 },		-- ポイゾガⅤ

	[  230 ] = { 135,   60 },		-- バイオ
	[  231 ] = { 135,  120 },		-- バイオⅡ
	[  232 ] = { 135,  180 },		-- バイオⅢ
	[  233 ] = { 135,  240 },		-- バイオⅣ
	[  234 ] = { 135,  300 },		-- バイオⅤ

	[  235 ] = { 128,   90 },		-- バーン
	[  236 ] = { 129,   90 },		-- フロスト
	[  237 ] = { 130,   90 },		-- チョーク
	[  238 ] = { 131,   90 },		-- ラスプ
	[  239 ] = { 132,   90 },		-- ショック
	[  240 ] = { 133,   90 },		-- ドラウン

	[  241 ] = nil,					-- リトレース
	[  242 ] = { { { 146,   90 } }, { {  90,   90 } } },		-- アブゾアキュル	対象:命中ダウン　自身:命中アップ
	[  243 ] = nil,					-- アブゾアトリ(良性ステータスの吸引)
	[  244 ] = nil,					-- メテオⅡ
	[  245 ] = {},					-- ドレイン
	[  246 ] = {},					-- ドレインⅡ
	[  247 ] = {},					-- アスピル
	[  248 ] = {},					-- アスピルⅡ

	[  249 ] = {  34,  180 },		-- ブレイズスパイク
	[  250 ] = {  35,  180 },		-- アイススパイク
	[  251 ] = {  38,  180 },		-- ショックスパイク

	[  252 ] = {  10,   12 },		-- スタン
	[  253 ] = {   2,   60 },		-- スリプル
	[  254 ] = {   5,  180 },		-- ブライン
	[  255 ] = {   7,   30 },		-- ブレイク
	[  256 ] = {  31,  480 },		-- ウィルス
	[  257 ] = {   9, 1800 },		-- カーズ
	[  258 ] = {  11,   60 },		-- バインド
	[  259 ] = {   2,   90 },		-- スリプルII

	[  260 ] = {},					-- ディスペル
	[  261 ] = {},					-- デジョン
	[  262 ] = {},					-- デジョンⅡ
	[  263 ] = {},					-- エスケプ
	[  264 ] = {},					-- トラクタ
	[  265 ] = {},					-- トラクタⅡ

	[  266 ] = { { { 136,   90 } }, { {  80,   90 } } },		-- アブゾースト　対象:STRダウン　自身:STRアップ
	[  267 ] = { { { 137,   90 } }, { {  81,   90 } } },		-- アブゾデック　対象:DEXダウン　自身:DEXアップ
	[  268 ] = { { { 138,   90 } }, { {  82,   90 } } },		-- アブゾバイト　対象:VITダウン　自身:VITアップ
	[  269 ] = { { { 139,   90 } }, { {  83,   90 } } },		-- アブゾアジル　対象:AGIダウン　自身:AGIアップ
	[  270 ] = { { { 140,   90 } }, { {  84,   90 } } },		-- アブゾイン　　対象:INTダウン　自身:INTアップ
	[  271 ] = { { { 141,   90 } }, { {  85,   90 } } },		-- アブゾマイン　対象:MNDダウン　自身:MNDアップ
	[  272 ] = { { { 142,   90 } }, { {  86,   90 } } },		-- アブゾカリス　対象:CHRダウン　自身:CHRアップ

	[  273 ] = {   2,   60 },		-- スリプガ
	[  274 ] = {   2,   90 },		-- スリプガII
	[  275 ] = {},					-- アブゾタック(TP吸収)
	[  276 ] = {   5,  180 },		-- ブラインⅡ
	[  277 ] = { 173,  180 },		-- ドレッドスパイク

	[  278 ] = { 186,  230 },		-- 土門の計
	[  279 ] = { 186,  230 },		-- 水門の計
	[  280 ] = { 186,  230 },		-- 風門の計
	[  281 ] = { 186,  230 },		-- 火門の計
	[  282 ] = { 186,  230 },		-- 氷門の計
	[  283 ] = { 186,  230 },		-- 雷門の計
	[  284 ] = { 186,  230 },		-- 闇門の計
	[  285 ] = { 186,  230 },		-- 光門の計

	[  286 ] = {  21,  180 },		-- アドル

	[  287 ] = { 407,  300 },		-- 虚誘掩殺の策

	[  288 ] = nil,					-- 火精霊召喚
	[  289 ] = nil,					-- 氷精霊召喚
	[  290 ] = nil,					-- 風精霊召喚
	[  291 ] = nil,					-- 土精霊召喚
	[  292 ] = nil,					-- 雷精霊召喚
	[  293 ] = nil,					-- 水精霊召喚
	[  294 ] = nil,					-- 光精霊召喚
	[  295 ] = nil,					-- 闇精霊召喚
	[  296 ] = nil,					-- カーバンクル召喚
	[  297 ] = nil,					-- フェンリル召喚
	[  298 ] = nil,					-- イフリート召喚
	[  299 ] = nil,					-- タイタン召喚
	[  300 ] = nil,					-- リヴァイアサン召喚
	[  301 ] = nil,					-- ガルーダ召喚
	[  302 ] = nil,					-- シヴァ召喚
	[  303 ] = nil,					-- ラムウ召喚
	[  304 ] = nil,					-- ディアボロス召喚
	[  305 ] = nil,					-- オーディン召喚
	[  306 ] = nil,					-- アレキサンダー召喚
	[  307 ] = nil,					-- ケット・シー召喚

	[  308 ] = { 289,  180 },		-- 悪事千里の策
	[  309 ] = { 289,  180 },		-- 暗中飛躍の策

	[  310 ] = { 274,  180 },		-- エンライト
	[  311 ] = { 288,  180 },		-- エンダーク
	[  312 ] = { 277,  180 },		-- エンファイアⅡ
	[  313 ] = { 278,  180 },		-- エンブリザドⅡ
	[  314 ] = { 279,  180 },		-- エンエアロⅡ
	[  315 ] = { 280,  180 },		-- エンストーンⅡ
	[  316 ] = { 281,  180 },		-- エンサンダーⅡ
	[  317 ] = { 282,  180 },		-- エンウォータⅡ

	[  318 ] = {  71,  420 },		-- 物見の術:壱
	[  319 ] = { 557,  120 },		-- 哀車の術:壱

	[  320 ] = { 167,   15 },		-- 火遁の術:壱　水耐性ダウン
	[  321 ] = { 167,   15 },		-- 火遁の術:弐　水耐性ダウン
	[  322 ] = { 167,   15 },		-- 火遁の術:参　水耐性ダウン
	[  323 ] = { 167,   15 },		-- 氷遁の術:壱　火耐性ダウン
	[  324 ] = { 167,   15 },		-- 氷遁の術:弐　火耐性ダウン
	[  325 ] = { 167,   15 },		-- 氷遁の術:参　火耐性ダウン
	[  326 ] = { 167,   15 },		-- 風遁の術:壱　氷耐性ダウン
	[  327 ] = { 167,   15 },		-- 風遁の術:弐　氷耐性ダウン
	[  328 ] = { 167,   15 },		-- 風遁の術:参　氷耐性ダウン
	[  329 ] = { 167,   15 },		-- 土遁の術:壱　風耐性ダウン
	[  330 ] = { 167,   15 },		-- 土遁の術:弐　風耐性ダウン
	[  331 ] = { 167,   15 },		-- 土遁の術:参　風耐性ダウン
	[  332 ] = { 167,   15 },		-- 雷遁の術:壱　土耐性ダウン
	[  333 ] = { 167,   15 },		-- 雷遁の術:弐　土耐性ダウン
	[  334 ] = { 167,   15 },		-- 雷遁の術:参　土耐性ダウン
	[  335 ] = { 167,   15 },		-- 水遁の術:壱　雷耐性ダウン
	[  336 ] = { 167,   15 },		-- 水遁の術:弐　雷耐性ダウン
	[  337 ] = { 167,   15 },		-- 水遁の術:参　雷耐性ダウン

	[  338 ] = {  66,  900 },		-- 空蝉の術:壱	ひとまず分身で対応
	[  339 ] = {  66,  900 },		-- 空蝉の術:弐	ひとまず分身で対応
	[  340 ] = {  66,  900 },		-- 空蝉の術:参	ひとまず分身で対応
	[  341 ] = {   4,  120 },		-- 呪縛の術:壱
	[  342 ] = {   4,  120 },		-- 呪縛の術:弐
	[  343 ] = {   4,  120 },		-- 呪縛の術:参
	[  344 ] = {  13,  300 },		-- 捕縄の術:壱
	[  345 ] = {  13,  300 },		-- 捕縄の術:弐
	[  346 ] = {  13,  300 },		-- 捕縄の術:参
	[  347 ] = {   5,  180 },		-- 暗闇の術:壱
	[  348 ] = {   5,  180 },		-- 暗闇の術:弐
	[  349 ] = {   5,  180 },		-- 暗闇の術:参
	[  350 ] = {   3,   90 },		-- 毒盛の術:壱
	[  351 ] = {   3,  120 },		-- 毒盛の術:弐
	[  352 ] = {   3,  150 },		-- 毒盛の術:参
	[  353 ] = {  69,  420 },		-- 遁甲の術:壱
	[  354 ] = {  69,  600 },		-- 遁甲の術:弐

	[  355 ] = nil,					-- セイレーン召喚

	[  356 ] = {   4,  120 },		-- パライガ
	[  357 ] = {  13,  180 },		-- スロウガ
	[  358 ] = {  33,  180 },		-- ヘイスガ
	[  359 ] = {   6,  120 },		-- サイレガ

	[  360 ] = {},					-- ディスペガ

	[  361 ] = {   5,  180 },		-- ブライガ
	[  362 ] = {  11,   60 },		-- バインガ
	[  363 ] = {   1,   60 },		-- スリプガ
	[  364 ] = {   1,   90 },		-- スリプガⅡ
	[  365 ] = {   7,   30 },		-- ブレクガ
	[  366 ] = {  12,   75 },		-- グラビガ

	[  367 ] = nil,					-- デス

	[  368 ] = { 192,   64 },		-- 魔物のレクイエム
	[  369 ] = { 192,   80 },		-- 魔物のレクイエムⅡ
	[  370 ] = { 192,   96 },		-- 魔物のレクイエムⅢ
	[  371 ] = { 192,  112 },		-- 魔物のレクイエムⅣ
	[  372 ] = { 192,  128 },		-- 魔物のレクイエムⅤ
	[  373 ] = { 192,  144 },		-- 魔物のレクイエムⅥ
	[  374 ] = { 192,  160 },		-- 魔物のレクイエムⅦ
	[  375 ] = { 192,  176 },		-- 魔物のレクイエムⅧ

	[  376 ] = { 193,   30 },		-- 魔物達のララバイ
	[  377 ] = { 193,   60 },		-- 魔物達のララバイⅡ

	[  378 ] = { 195,  120 },		-- 戦士達のピーアン
	[  379 ] = { 195,  120 },		-- 戦士達のピーアンⅡ
	[  380 ] = { 195,  120 },		-- 戦士達のピーアンⅢ
	[  381 ] = { 195,  120 },		-- 戦士達のピーアンⅣ
	[  382 ] = { 195,  120 },		-- 戦士達のピーアンⅤ
	[  383 ] = { 195,  120 },		-- 戦士達のピーアンⅥ
	[  384 ] = { 195,  120 },		-- 戦士達のピーアンⅦ
	[  385 ] = { 195,  120 },		-- 戦士達のピーアンⅧ

	[  386 ] = { 196,  120 },		-- 魔道士のバラード
	[  387 ] = { 196,  120 },		-- 魔道士のバラードⅡ
	[  388 ] = { 196,  120 },		-- 魔道士のバラードⅢ

	[  389 ] = { 197,  120 },		-- 重装騎兵のミンネ
	[  390 ] = { 197,  120 },		-- 重装騎兵のミンネⅡ
	[  391 ] = { 197,  120 },		-- 重装騎兵のミンネⅢ
	[  392 ] = { 197,  120 },		-- 重装騎兵のミンネⅣ
	[  393 ] = { 197,  120 },		-- 重装騎兵のミンネⅤ

	[  394 ] = { 198,  120 },		-- 猛者のメヌエット
	[  395 ] = { 198,  120 },		-- 猛者のメヌエットⅡ
	[  396 ] = { 198,  120 },		-- 猛者のメヌエットⅢ
	[  397 ] = { 198,  120 },		-- 猛者のメヌエットⅣ
	[  398 ] = { 198,  120 },		-- 猛者のメヌエットⅤ

	[  399 ] = { 199,  120 },		-- 剣闘士のマドリガル
	[  400 ] = { 199,  120 },		-- 剣豪のマドリガル
	[  401 ] = { 200,  120 },		-- 狩人のプレリュード
	[  402 ] = { 200,  120 },		-- 弓師のプレリュード
	[  403 ] = { 201,  120 },		-- 闘羊士のマンボ
	[  404 ] = { 201,  120 },		-- 闘龍士のマンボ
	[  405 ] = { 202,  120 },		-- 鶏のオーバード
	[  406 ] = { 203,  120 },		-- 薬草のパストラル
	[  407 ] = { 204,  120 },		-- チョコボのハミング
	[  408 ] = { 205,  120 },		-- 光明のファンタジア
	[  409 ] = { 206,  120 },		-- 小話のオペレッタ
	[  410 ] = { 206,  120 },		-- 腹話のオペレッタ
	[  411 ] = { 206,  120 },		-- 道化のオペレッタ
	[  412 ] = { 207,  120 },		-- 黄金のカプリチオ
	[  413 ] = { 208,  120 },		-- 献身のセレナーデ
	[  414 ] = { 209,  120 },		-- 破邪のロンド
	[  415 ] = { 210,  120 },		-- ゴブリンのガボット
	[  416 ] = { 211,  120 },		-- サボテンダーフーガ
	[  417 ] = { 214,  120 },		-- 栄典の戴冠マーチ
	[  418 ] = { 231,  120 },		-- 静と情熱のアリア
	[  419 ] = { 214,  120 },		-- 無敵の進撃マーチ
	[  420 ] = { 214,  120 },		-- 栄光の凱旋マーチ
	[  421 ] = { 194,  120 },		-- 戦場のエレジー
	[  422 ] = { 194,  180 },		-- 修羅のエレジー
	[  423 ] = { 194,  240 },		-- 地獄のエレジー
	[  424 ] = { 215,  120 },		-- 剛力のエチュード
	[  425 ] = { 215,  120 },		-- 器用のエチュード
	[  426 ] = { 215,  120 },		-- 元気のエチュード
	[  427 ] = { 215,  120 },		-- 機敏のエチュード
	[  428 ] = { 215,  120 },		-- 知恵のエチュード
	[  429 ] = { 215,  120 },		-- 精神のエチュード
	[  430 ] = { 215,  120 },		-- 魅了のエチュード
	[  431 ] = { 215,  120 },		-- 怪力のエチュード
	[  432 ] = { 215,  120 },		-- 妙技のエチュード
	[  433 ] = { 215,  120 },		-- 活力のエチュード
	[  434 ] = { 215,  120 },		-- 俊敏のエチュード
	[  435 ] = { 215,  120 },		-- 英知のエチュード
	[  436 ] = { 215,  120 },		-- 理力のエチュード
	[  437 ] = { 215,  120 },		-- 魅惑のエチュード
	[  438 ] = { 216,  120 },		-- 耐火カロル第一楽章
	[  439 ] = { 216,  120 },		-- 耐寒カロル第一楽章
	[  440 ] = { 216,  120 },		-- 耐風カロル第一楽章
	[  441 ] = { 216,  120 },		-- 耐震カロル第一楽章
	[  442 ] = { 216,  120 },		-- 耐電カロル第一楽章
	[  443 ] = { 216,  120 },		-- 耐波カロル第一楽章
	[  444 ] = { 216,  120 },		-- 耐光カロル第一楽章
	[  445 ] = { 216,  120 },		-- 耐闇カロル第一楽章
	[  446 ] = { 216,  120 },		-- 耐火カロル第二楽章
	[  447 ] = { 216,  120 },		-- 耐寒カロル第二楽章
	[  448 ] = { 216,  120 },		-- 耐風カロル第二楽章
	[  449 ] = { 216,  120 },		-- 耐震カロル第二楽章
	[  450 ] = { 216,  120 },		-- 耐電カロル第二楽章
	[  451 ] = { 216,  120 },		-- 耐波カロル第二楽章
	[  452 ] = { 216,  120 },		-- 耐光カロル第二楽章
	[  453 ] = { 216,  120 },		-- 耐闇カロル第二楽章
	[  454 ] = { 217,   60 },		-- 炎のスレノディ
	[  455 ] = { 217,   60 },		-- 氷のスレノディ
	[  456 ] = { 217,   60 },		-- 風のスレノディ
	[  457 ] = { 217,   60 },		-- 土のスレノディ
	[  458 ] = { 217,   60 },		-- 雷のスレノディ
	[  459 ] = { 217,   60 },		-- 水のスレノディ
	[  460 ] = { 217,   60 },		-- 光のスレノディ
	[  461 ] = { 217,   60 },		-- 闇のスレノディ

	[  462 ] = {},					-- 魔法のフィナーレ

	[  463 ] = { 193,   30 },		-- 魔物のララバイ
	[  464 ] = { 218,  120 },		-- 女神のヒムヌス
	[  465 ] = { 219,  120 },		-- チョコボのマズルカ
	[  466 ] = { 224,   30 },		-- 乙女のヴィルレー		効果は魅了
	[  467 ] = { 219,  120 },		-- ラプトルのマズルカ
	[  468 ] = { 220,  120 },		-- 魔物のシルベント
	[  469 ] = { 221,  120 },		-- 冒険者のダージュ
	[  470 ] = { 222,  120 },		-- 警戒のスケルツォ
	[  471 ] = { 193,   60 },		-- 魔物のララバイⅡ
	[  472 ] = { 223,  270 },		-- 恋情のノクターン

	[  473 ] = {  43,  150 },		-- リフレシュⅡ

	[  474 ] = {},					-- ケアルラⅡ
	[  475 ] = {},					-- ケアルラⅢ

	[  476 ] = { 289,  300 },		-- クルセード
	[  477 ] = {  42,   60 },		-- リジェネⅣ
	[  478 ] = { 228,   90 },		-- オーラ

	[  479 ] = { 119,  300 },		-- アディスト
	[  480 ] = { 120,  300 },		-- アディデック
	[  481 ] = { 121,  300 },		-- アディバイト
	[  482 ] = { 122,  300 },		-- アディアジル
	[  483 ] = { 123,  300 },		-- アディイン
	[  484 ] = { 124,  300 },		-- アディマイン
	[  485 ] = { 125,  300 },		-- アディカリス
	[  486 ] = { 119,  300 },		-- ゲインスト
	[  487 ] = { 120,  300 },		-- ゲインデック
	[  488 ] = { 121,  300 },		-- ゲインバイト
	[  489 ] = { 122,  300 },		-- ゲインアジル
	[  490 ] = { 123,  300 },		-- ゲインイン
	[  491 ] = { 124,  300 },		-- ゲインマイン
	[  492 ] = { 125,  300 },		-- ゲインカリス

	[  493 ] = { 432,  180 },		-- ストライ

	[  494 ] = nil,					-- アレイズ

	[  495 ] = { 170,  180 },		-- 鼓舞激励の策

	[  496 ] = { 167,   60 },		-- ファイジャ
	[  497 ] = { 167,   60 },		-- ブリザジャ
	[  498 ] = { 167,   60 },		-- エアロジャ
	[  499 ] = { 167,   60 },		-- ストンジャ
	[  500 ] = { 167,   60 },		-- サンダジャ
	[  501 ] = { 167,   60 },		-- ウォタジャ

	[  502 ] = {  23,  180 },		-- メルトン
	[  503 ] = {  23,  180 },		-- インパクト

	[  504 ] = {  42,   60 },		-- リジェネⅤ

	[  505 ] = { 289,  300 },		-- 月下の術:壱
	[  506 ] = { 171,  300 },		-- 夜陰の術:壱
	[  507 ] = { 290,  300 },		-- 妙手の術:壱
	[  508 ] = { 168,  180 },		-- 幽林の術:壱
	[  509 ] = { 227,  300 },		-- 活火の術:壱
	[  510 ] = { 471,   60 },		-- 身替の術:壱

	[  511 ] = {  33,  180 },		-- ヘイストⅡ

	[  513 ] = {  41,   90 },		-- ベノムシェル

	[  515 ] = { 136,   90 },		-- メイルシュトロム

	[  517 ] = {  37,  900 },		-- メタルボディ

	[  519 ] = nil,					-- S.ドライバー

	[  521 ] = nil,					-- MP吸収キッス
	[  522 ] = nil,					-- デスレイ

	[  524 ] = { 146,   30 },		-- 土竜巻

	[  527 ] = nil,					-- 怒りの一撃
	[  529 ] = nil,					-- メッタ打ち

	[  530 ] = {  33,  300 },		-- リフュエリング
	[  531 ] = {  11,   60 },		-- アイスブレイク
	[  532 ] = {  10,    8 },		-- B.シュトラール

	[  533 ] = nil,					-- 自爆

	[  534 ] = {  12,   68 },		-- 神秘の光
	[  535 ] = { 129,   90 },		-- コールドウェーブ
	[  536 ] = {   3,   25 },		-- ポイズンブレス

	[  537 ] = { 138,   60 },		-- スティンキングガス
	[  538 ] = { 190,   60 },		-- メメントモーリ
	[  539 ] = { 147,   60 },		-- テラータッチ
	[  540 ] = nil,					-- スパイナルクリーブ
	[  541 ] = nil,					-- ブラッドセイバー
	[  542 ] = nil,					-- 消化
	[  543 ] = nil,					-- M.バイト
	[  544 ] = nil,					-- カースドスフィア
	[  545 ] = nil,					-- シックルスラッシュ

	[  547 ] = {  93,   90 },		-- コクーン
	[  548 ] = { 565,   90 },		-- F.ホールド
	[  549 ] = nil,					-- 花粉

	[  551 ] = nil,					-- パワーアタック

	[  554 ] = nil,					-- デスシザース
	[  555 ] = {  12,   68 },		-- 磁鉄粉

	[  557 ] = nil,					-- アイズオンミー

	[  560 ] = nil,					-- F.リップ
	[  561 ] = { 148,  180 },		-- フライトフルロア

	[  563 ] = {   5,   60 },		-- ヘカトンウェーブ
	[  564 ] = nil,					-- ボディプレス

	[  565 ] = { { 6,   90 }, { 13,  90 } },		-- R.ブレス(静寂・スロウ)

	[  567 ] = nil,					-- ヘルダイブ

	[  569 ] = nil,					-- ジェットストリーム
	[  570 ] = nil,					-- 吸血

	[  572 ] = { 140,   90 },		-- サウンドブラスト
	[  573 ] = nil,					-- フェザーティックル
	[  574 ] = {  92,   30 },		-- フェザーバリア
	[  575 ] = {  28,    2 },		-- ジェタチュラ
	[  576 ] = {   2,   80 },		-- ヤーン
	[  577 ] = nil,					-- フットキック
	[  578 ] = nil,					-- ワイルドカロット
	[  579 ] = nil,					-- 吸印

	[  581 ] = nil,					-- いやしの風
	[  582 ] = {   6,   60 },		-- カオティックアイ

	[  584 ] = {   2,   60 },		-- シープソング
	[  585 ] = nil,					-- ラムチャージ

	[  587 ] = nil,					-- クローサイクロン
	[  588 ] = {  31,   40 },		-- ロウイン
	[  589 ] = nil,					-- 次元殺

	[  591 ] = nil,					-- 火炎の息
	[  592 ] = nil,					-- ブランクゲイズ
	[  593 ] = nil,					-- マジックフルーツ
	[  594 ] = nil,					-- アッパーカット
	[  595 ] = nil,					-- 針千本
	[  596 ] = {   2,   30 },		-- まつぼっくり爆弾
	[  597 ] = { 123,  240 },		-- スプラウトスマック
	[  598 ] = {   2,   90 },		-- サペリフィック
	[  599 ] = {   3,  120 },		-- マヨイタケ

	[  603 ] = { 138,   60 },		-- 種まき
	[  604 ] = { {   4,   40 }, {   6,   40 }, {   3,   40 }, {  12,   40 }, { 11,   40 }, {  13,   40 }, {   5,   40 } },		-- 臭い息(麻痺・静寂・毒・ヘヴィ・バインド・スロウ・暗闇)
	[  605 ] = nil,					-- ガイストウォール
	[  606 ] = { 136,   30 },		-- アーフルアイ

	[  608 ] = {   4,  180 },		-- フロストブレス

	[  610 ] = { 148,   60 },		-- 超低周波
	[  611 ] = {   3,  180 },		-- ディセバーメント
	[  612 ] = { 156,   15 },		-- A.バースト
	[  613 ] = { {  93,  180 }, {  35,  180 } },		-- 反応炉冷却(防御力アップ・アイススパイク)
	[  614 ] = { 191,  180 },		-- セイリーンコート
	[  615 ] = {  38,  900 },		-- プラズマチャージ
	[  616 ] = {  10,    5 },		-- テンポラルシフト
	[  617 ] = nil,					-- バーチカルクリーヴ
	[  618 ] = {  11,   60 },		-- 炸裂弾

	[  620 ] = { 137,   60 },		-- バトルダンス
	[  621 ] = {   5,   90 },		-- サンドスプレー
	[  622 ] = nil,					-- グランドスラム
	[  623 ] = {  10,    5 },		-- ヘッドバット

	[  626 ] = nil,					-- 爆弾投げ

	[  628 ] = {  10,    5 },		-- フライパン
	[  629 ] = nil,					-- F.ヒッププレス

	[  631 ] = nil,					-- ハイドロショット
	[  632 ] = {  37,  900 },		-- 金剛身
	[  633 ] = { { 149,   30 }, { 167,   30 } },		-- 吶喊(防御力ダウン・魔法防御力ダウン)
	[  634 ] = { {   5,   30 }, {  11,   30 } },		-- 贖罪の光(暗闇・バインド)

	[  636 ] = { {  90,  180 }, {  92, 180 } },			-- ワームアップ(命中率アップ・回避率アップ)
	[  637 ] = nil,					-- ファイアースピット
	[  638 ] = {   3,   60 },		-- 羽根吹雪

	[  640 ] = {  10,    5 },		-- テールスラップ
	[  641 ] = nil,					-- H.バラージ
	[  642 ] = { { 190,   90 }, { 191,   90 } },		-- ねたみ種(魔法攻撃力アップ・魔法防御力アップ)
	[  643 ] = nil,					-- キャノンボール
	[  644 ] = {   4,   90 },		-- マインドブラスト
	[  645 ] = nil,					-- イグジュビエーション
	[  646 ] = nil,					-- マジックハンマー
	[  647 ] = {  36,  900 },		-- ゼファーマント
	[  648 ] = {  11,   35 },		-- リガージテーション

	[  650 ] = { 149,   60 },		-- シードスプレー
	[  651 ] =  {{ 147,   60 }, { 149,   60 } },		-- コローシブウーズ(攻撃力ダウン・防御力ダウン)
	[  652 ] = { 146,   60 },		-- スパイラルスピン
	[  653 ] = nil,					-- アシュラクロー
	[  654 ] = {   4,  180 },		-- サブゼロスマッシュ
	[  655 ] = {  91,   90 },		-- 共鳴
	[  656 ] = { 167,  120 },		-- アクリッドストリーム
	[  657 ] = nil,					-- ブレーズバウンド
	[  658 ] = { {   91,  90 }, { 190,   90 } },		-- P.エンブレイス(攻撃力アップ・魔法攻撃力アップ)
	[  659 ] = { 147,   30 },		-- D.ロア
	[  660 ] = {  13,   90 },		-- C.ディスチャージ
	[  661 ] = {  33,  300 },		-- 鯨波
	[  662 ] = {  43,  300 },		-- バッテリーチャージ
	[  663 ] = nil,					-- リーフストーム
	[  664 ] = {  42,   90 },		-- リジェネレーション
	[  665 ] = nil,					-- ファイナルスピア
	[  666 ] = nil,					-- ゴブリンラッシュ
	[  667 ] = nil,					-- バニティダイブ
	[  668 ] = { 152,  900 },		-- マジックバリア
	[  669 ] = {  10,    5 },		-- 怒りの旋風
	[  670 ] = { { 149,   60 }, { 167,   60 } },		-- ベンシクタイフーン(防御力ダウン・魔法防御力ダウン)
	[  671 ] = { {   6,   50 }, {   5,   50 } },		-- オーロラルドレープ(静寂・暗闇)
	[  672 ] = nil,					-- オスモーシス
	[  673 ] = nil,					-- 四連突
	[  674 ] = { {  91,  180 }, { 190,  180 } },		-- ファンタッド(攻撃力アップ・魔法攻撃力アップ)
	[  675 ] = {   5,   50 },		-- サーマルパルス

	[  677 ] = nil,					-- エンプティスラッシュ
	[  678 ] = {   2,   90 },		-- 夢想花
	[  679 ] = {  36,  300 },		-- オカルテーション
	[  680 ] = nil,					-- チャージドホイスカー
	[  681 ] = nil,					-- 虚無の風
	[  682 ] = {  31,   45 },		-- デルタスラスト
	[  683 ] = nil,					-- みんなの怨み
	[  684 ] = nil,					-- リービンウィンド
	[  685 ] = { 116,  180 },		-- 牙門
	[  686 ] = {  15,   60 },		-- モータルレイ
	[  687 ] = {   6,  105 },		-- 水風船爆弾
	[  688 ] = nil,					-- 重い一撃
	[  689 ] = nil,					-- ダークオーブ
	[  690 ] = nil,					-- ホワイトウィンド

	[  692 ] = {  10,    6 },		-- サドンランジ
	[  693 ] = nil,					-- クアドラストライク
	[  694 ] = nil,					-- ヴェイパースプレー
	[  695 ] = nil,					-- サンダーブレス
	[  696 ] = { 486,  180 },		-- カウンタースタンス
	[  697 ] = nil,					-- 槍玉
	[  698 ] = nil,					-- ウィンドブレス
	[  699 ] = { 146,  120 },		-- 偃月刃
	[  700 ] = {  91,   90 },		-- N.メディテイト
	[  701 ] = nil,					-- T.アップヒーヴ
	[  702 ] = nil,					-- R.デルージュ　　ディスペル処理
	[  703 ] = {  13,  180 },		-- エンバームアース
	[  704 ] = {   4,  120 },		-- パラライズトライアド
	[  705 ] = { 133,  180 },		-- ファウルウォーター
	[  706 ] = nil,					-- グルーティナスダート
	[  707 ] = { 156,   15 },		-- レテナグレア
	[  708 ] = {  12,   70 },		-- サブダックション
	[  709 ] = nil,					-- T.アッサルト
	[  710 ] = {  33,  300 },		-- エラチックフラッター
	[  711 ] = nil,					-- レストラル
	[  712 ] = nil,					-- レールキャノン
	[  713 ] = nil,					-- ディフュージョンレイ
	[  714 ] = nil,					-- シンカードリル
	[  715 ] = nil,					-- モルトプルメイジ
	[  716 ] = {   3,   30 },		-- ネクターデルージュ
	[  717 ] = { 149,   90 },		-- スイープガウジ
	[  718 ] = nil,					-- A.ライベーション
	[  719 ] = { 128,   60 },		-- シアリングテンペスト
	[  720 ] = {  28,   30 },		-- スペクトラルフロー
	[  721 ] = {  10,    5 },		-- アンビルライトニング
	[  722 ] = {   7,   60 },		-- エントゥーム
	[  723 ] = { 147,   50 },		-- サウリアンスライド
	[  724 ] = { 135,   80 },		-- ポーリングサルヴォ
	[  725 ] = { 156,   15 },		-- B.フルゴア
	[  726 ] = { 147,  180 },		-- スカウリングスペイト
	[  727 ] = {   6,  300 },		-- サイレントストーム
	[  728 ] = { 149,  180 },		-- テネブラルクラッシュ

	[  736 ] = {  10,    6 },		-- サンダーボルト
	[  737 ] = {  93,   90 },		-- 甲羅強化
	[  738 ] = {  28,   25 },		-- アブソルートテラー
	[  739 ] = { 128,   90 },		-- ゲーツオブハデス
	[  740 ] = { 149,  105 },		-- トゥールビヨン
	[  741 ] = { 150,  180 },		-- ポーラーブルワーク
	[  742 ] = { { 147,   50 }, { 149,   50 }, { 146,   50 } },	-- ビルジストーム(攻撃力ダウン・防御力ダウン・命中率ダウン)
	[  743 ] = nil,					-- ブラッドレイク
	[  744 ] = nil,					-- D.ワールウィンド
	[  745 ] = { {  91,   60 }, { 190,   60 }, {  39,  900 } },	-- カルカリアンヴァーヴ(攻撃力アップ・魔法攻撃力アップ・アクアベール)
	[  746 ] = {  28,   30 },		-- ブリスターローア
	[  747 ] = nil,					-- アップルート
	[  748 ] = nil,					-- クラッシュサンダー
	[  749 ] = {  11,   60 },		-- ポラーロア
	[  750 ] = { 604,  180 },		-- マイティガード
	[  751 ] = {  15,   30 },		-- クルエルジョーク
	[  752 ] = {  31,   45 },		-- セスプール
	[  753 ] = { 167,   60 },		-- テーリングガスト

	[  768 ] = { 539,  180 },		-- インデリジェネ
	[  769 ] = { 540,  180 },		-- インデポイズン
	[  770 ] = { 541,  180 },		-- インデリフレシュ
	[  771 ] = { 580,  180 },		-- インデヘイスト
	[  772 ] = { 542,  180 },		-- インデスト
	[  773 ] = { 543,  180 },		-- インデデック
	[  774 ] = { 544,  180 },		-- インデバイト
	[  775 ] = { 545,  180 },		-- インデアジル
	[  776 ] = { 546,  180 },		-- インデイン
	[  777 ] = { 547,  180 },		-- インデマイン
	[  778 ] = { 548,  180 },		-- インデカリス
	[  779 ] = { 549,  180 },		-- インデフューリー
	[  780 ] = { 550,  180 },		-- インデバリア
	[  781 ] = { 551,  180 },		-- インデアキュメン
	[  782 ] = { 552,  180 },		-- インデフェンド
	[  783 ] = { 553,  180 },		-- インデプレサイス
	[  784 ] = { 554,  180 },		-- インデヴォイダンス
	[  785 ] = { 555,  180 },		-- インデフォーカス
	[  786 ] = { 556,  180 },		-- インデアトゥーン
	[  787 ] = { 557,  180 },		-- インデウィルト
	[  788 ] = { 558,  180 },		-- インデフレイル
	[  789 ] = { 559,  180 },		-- インデフェイド
	[  790 ] = { 560,  180 },		-- インデマレーズ
	[  791 ] = { 561,  180 },		-- インデスリップ
	[  792 ] = { 562,  180 },		-- インデトーパー
	[  793 ] = { 563,  180 },		-- インデヴェックス
	[  794 ] = { 564,  180 },		-- インデランゴール
	[  795 ] = { 565,  180 },		-- インデスロウ
	[  796 ] = { 566,  180 },		-- インデパライズ
	[  797 ] = { 567,  180 },		-- インデグラビデ

	[  798 ] = { 539,  210 },		-- ジオリジェネ
	[  799 ] = { 540,  210 },		-- ジオポイズン
	[  800 ] = { 541,  210 },		-- ジオリフレシュ
	[  801 ] = { 580,  210 },		-- ジオヘイスト
	[  802 ] = { 542,  210 },		-- ジオスト
	[  803 ] = { 543,  210 },		-- ジオデック
	[  804 ] = { 544,  210 },		-- ジオバイト
	[  805 ] = { 545,  210 },		-- ジオアジル
	[  806 ] = { 546,  210 },		-- ジオイン
	[  807 ] = { 547,  210 },		-- ジオマイン
	[  808 ] = { 548,  210 },		-- ジオカリス
	[  809 ] = { 549,  210 },		-- ジオフューリー
	[  810 ] = { 550,  210 },		-- ジオバリア
	[  811 ] = { 551,  210 },		-- ジオアキュメン
	[  812 ] = { 552,  210 },		-- ジオフェンド
	[  813 ] = { 553,  210 },		-- ジオプレサイス
	[  814 ] = { 554,  210 },		-- ジオヴォイダンス
	[  815 ] = { 555,  210 },		-- ジオフォーカス
	[  816 ] = { 556,  210 },		-- ジオアトゥーン
	[  817 ] = { 557,  210 },		-- ジオウィルト
	[  818 ] = { 558,  210 },		-- ジオフレイル
	[  819 ] = { 559,  210 },		-- ジオフェイド
	[  820 ] = { 560,  210 },		-- ジオマレーズ
	[  821 ] = { 561,  210 },		-- ジオスリップ
	[  822 ] = { 562,  210 },		-- ジオトーパー
	[  823 ] = { 563,  210 },		-- ジオヴェックス
	[  824 ] = { 564,  210 },		-- ジオランゴール
	[  825 ] = { 565,  210 },		-- ジオスロウ
	[  826 ] = { 566,  210 },		-- ジオパライズ
	[  827 ] = { 567,  210 },		-- ジオグラビデ

	[  828 ] = {},					-- ファイラ
	[  829 ] = {},					-- ファイラⅡ
	[  830 ] = {},					-- ブリザラ
	[  831 ] = {},					-- ブリザラⅡ
	[  832 ] = {},					-- エアロラ
	[  833 ] = {},					-- エアロラⅡ
	[  834 ] = {},					-- ストンラ
	[  835 ] = {},					-- ストンラⅡ
	[  836 ] = {},					-- サンダラ
	[  837 ] = {},					-- サンダラⅡ
	[  838 ] = {},					-- ウォタラ
	[  839 ] = {},					-- ウォタラⅡ
	[  840 ] = { 568,   30 },		-- フォイル
	[  841 ] = { 148,  300 },		-- ディストラ
	[  842 ] = { 148,  300 },		-- ディストラⅡ
	[  843 ] = { 404,  300 },		-- フラズル
	[  844 ] = { 404,  300 },		-- フラズルⅡ
	[  845 ] = { 581,  180 },		-- スナップ
	[  846 ] = { 581,  180 },		-- スナップⅡ
	[  847 ] = nil,					-- アトモス召喚
	[  848 ] = { 113, 3600 },		-- リレイズⅣ
	[  849 ] = {},					-- ファイアⅣ
	[  850 ] = {},					-- ブリザドⅣ
	[  851 ] = {},					-- エアロⅣ
	[  852 ] = {},					-- ストーンⅣ
	[  853 ] = {},					-- サンダーⅣ
	[  854 ] = {},					-- ウォータⅣ
	[  855 ] = { 274,  180 },		-- エンライトⅡ
	[  856 ] = { 288,  180 },		-- エンダークⅡ

	[  857 ] = { 592,  180 },		-- 砂塵の陣Ⅱ
	[  858 ] = { 594,  180 },		-- 豪雨の陣Ⅱ
	[  859 ] = { 591,  180 },		-- 烈風の陣Ⅱ
	[  860 ] = { 589,  180 },		-- 熱波の陣Ⅱ
	[  861 ] = { 590,  180 },		-- 吹雪の陣Ⅱ
	[  862 ] = { 593,  180 },		-- 疾雷の陣Ⅱ
	[  863 ] = { 596,  180 },		-- 妖霧の陣Ⅱ
	[  864 ] = { 595,  180 },		-- 極光の陣Ⅱ

	[  865 ] = {},					-- ファイラⅢ
	[  866 ] = {},					-- ブリザラⅢ
	[  867 ] = {},					-- エアロラⅢ
	[  868 ] = {},					-- ストンラⅢ
	[  869 ] = {},					-- サンダラⅢ
	[  870 ] = {},					-- ウォタラⅢ

	[  871 ] = { 217,   90 },		-- 炎のスレノディⅡ
	[  872 ] = { 217,   90 },		-- 氷のスレノディⅡ
	[  873 ] = { 217,   90 },		-- 風のスレノディⅡ
	[  874 ] = { 217,   90 },		-- 土のスレノディⅡ
	[  875 ] = { 217,   90 },		-- 雷のスレノディⅡ
	[  876 ] = { 217,   90 },		-- 水のスレノディⅡ
	[  877 ] = { 217,   90 },		-- 光のスレノディⅡ
	[  878 ] = { 217,   90 },		-- 闇のスレノディⅡ

	[  879 ] = { 597,  300 },		-- イナンデーション
	[  880 ] = {},					-- ドレインⅢ
	[  881 ] = {},					-- アスピルⅢ
	[  882 ] = { 148,  300 },		-- ディストラⅢ
	[  883 ] = { 404,  300 },		-- フラズルⅢ
	[  884 ] = {  21,  180 },		-- アドルⅡ

	[  885 ] = { 186,   90 },		-- 土門の計Ⅱ　最大強化 230
	[  886 ] = { 186,   90 },		-- 水門の計Ⅱ　最大強化 230
	[  887 ] = { 186,   90 },		-- 風門の計Ⅱ　最大強化 230
	[  888 ] = { 186,   90 },		-- 火門の計Ⅱ　最大強化 230
	[  889 ] = { 186,   90 },		-- 氷門の計Ⅱ　最大強化 230
	[  890 ] = { 186,   90 },		-- 雷門の計Ⅱ　最大強化 230
	[  891 ] = { 186,   90 },		-- 闇門の計Ⅱ　最大強化 230
	[  892 ] = { 186,   90 },		-- 光門の計Ⅱ　最大強化 230

	[  893 ] = nil,					-- フルケア
	[  894 ] = {  43,  150 },		-- リフレシュⅢ
	[  895 ] = { 432,  180 },		-- ストライⅡ

	[  896 ] = {},					-- シャントット
	[  897 ] = {},					-- ナジ
	[  898 ] = {},					-- クピピ
	[  899 ] = {},					-- エグセニミル
	[  900 ] = {},					-- アヤメ
	[  901 ] = {},					-- ナナー・ミーゴ
	[  902 ] = {},					-- クリルラ
	[  903 ] = {},					-- フォルカー
	[  904 ] = {},					-- アジドマルジド
	[  905 ] = {},					-- トリオン
	[  906 ] = {},					-- ザイド
	[  907 ] = {},					-- ライオン
	[  908 ] = {},					-- テンゼン
	[  909 ] = {},					-- ミリ・アリアポー
	[  910 ] = {},					-- ヴァレンラール
	[  911 ] = {},					-- ヨアヒム
	[  912 ] = {},					-- ナジャ・サラヒム
	[  913 ] = {},					-- プリッシュ
	[  914 ] = {},					-- ウルミア
	[  915 ] = {},					-- スカリーZ
	[  916 ] = {},					-- チェルキキ
	[  917 ] = {},					-- アイアンイーター
	[  918 ] = {},					-- ゲッショー
	[  919 ] = {},					-- ガダラル
	[  920 ] = {},					-- ライニマード
	[  921 ] = {},					-- イングリッド
	[  922 ] = {},					-- レコ・ハボッカ
	[  923 ] = {},					-- ナシュメラ
	[  924 ] = {},					-- ザザーグ
	[  925 ] = {},					-- アヴゼン
	[  926 ] = {},					-- メネジン
	[  927 ] = {},					-- サクラ
	[  928 ] = {},					-- ルザフ
	[  929 ] = {},					-- ナジュリス
	[  930 ] = {},					-- アルド
	[  931 ] = {},					-- モーグリ
	[  932 ] = {},					-- ファブリニクス
	[  933 ] = {},					-- マート
	[  934 ] = {},					-- D.シャントット
	[  935 ] = {},					-- 星の神子
	[  936 ] = {},					-- カラハバルハ
	[  937 ] = {},					-- シド
	[  938 ] = {},					-- ギルガメッシュ
	[  939 ] = {},					-- アレヴァト
	[  940 ] = {},					-- セミ・ラフィーナ
	[  941 ] = {},					-- エリヴィラ
	[  942 ] = {},					-- ノユリ
	[  943 ] = {},					-- ルー・マカラッカ
	[  944 ] = {},					-- フェリアスコフィン
	[  945 ] = {},					-- リリゼット
	[  946 ] = {},					-- ミュモル
	[  947 ] = {},					-- ウカ・トトゥリン
	[  948 ] = {},					-- クララ
	[  949 ] = {},					-- ロマー・ミーゴ
	[  950 ] = {},					-- クイン・ハスデンナ
	[  951 ] = {},					-- ラーアル
	[  952 ] = {},					-- コルモル
	[  953 ] = {},					-- ピエージェ(UC)
	[  954 ] = {},					-- I.シールド(UC)
	[  955 ] = {},					-- アプルル(UC)
	[  956 ] = {},					-- ジャコ(UC)
	[  957 ] = {},					-- フラヴィリア(UC)
	[  958 ] = {},					-- ウェイレア
	[  959 ] = {},					-- アベンツィオ
	[  960 ] = {},					-- ルガジーン
	[  961 ] = {},					-- クッキーチェブキー
	[  962 ] = {},					-- マルグレート
	[  963 ] = {},					-- チャチャルン
	[  964 ] = {},					-- レイ・ランガヴォ
	[  965 ] = {},					-- アシェラ
	[  966 ] = {},					-- マヤコフ
	[  967 ] = {},					-- クルタダ
	[  968 ] = {},					-- アーデルハイト
	[  969 ] = {},					-- アムチュチュ
	[  970 ] = {},					-- ブリジッド
	[  971 ] = {},					-- ミルドリオン
	[  972 ] = {},					-- ハルヴァー
	[  973 ] = {},					-- ロンジェルツ
	[  974 ] = {},					-- レオノアーヌ
	[  975 ] = {},					-- マクシミリアン
	[  976 ] = {},					-- カイルパイル
	[  977 ] = {},					-- ロベルアクベル
	[  978 ] = {},					-- クポフリート
	[  979 ] = {},					-- セルテウス
	[  980 ] = {},					-- ヨランオラン(UC)
	[  981 ] = {},					-- シルヴィ(UC)
	[  982 ] = {},					-- アブクーバ
	[  983 ] = {},					-- バラモア
	[  984 ] = {},					-- オーグスト
	[  985 ] = {},					-- ロスレーシャ
	[  986 ] = {},					-- テオドール
	[  987 ] = {},					-- ウルゴア
	[  988 ] = {},					-- マッキーチェブキー
	[  989 ] = {},					-- キング・オブ・ハーツ
	[  990 ] = {},					-- モリマー
	[  991 ] = {},					-- ダラクァルン
	[  992 ] = {},					-- アークHM
	[  993 ] = {},					-- アークEV
	[  994 ] = {},					-- アークMR
	[  995 ] = {},					-- アークTT
	[  996 ] = {},					-- アークGK
	[  997 ] = {},					-- イロハ
	[  998 ] = {},					-- ユグナス
	[  999 ] = {},					-- モンブロー

	[ 1004 ] = {},					-- エグセニミルⅡ
	[ 1005 ] = {},					-- アヤメ(UC)
	[ 1006 ] = {},					-- マート(UC)
	[ 1007 ] = {},					-- アルド(UC)
	[ 1008 ] = {},					-- ナジャ(UC)
	[ 1009 ] = {},					-- ライオンⅡ
	[ 1010 ] = {},					-- ザイドⅡ
	[ 1011 ] = {},					-- プリッシュⅡ
	[ 1012 ] = {},					-- ナシュメラⅡ
	[ 1013 ] = {},					-- リリゼットⅡ
	[ 1014 ] = {},					-- テンゼンⅡ
	[ 1015 ] = {},					-- ミュモルⅡ
	[ 1016 ] = {},					-- イングリッドⅡ
	[ 1017 ] = {},					-- アシェラⅡ
	[ 1018 ] = {},					-- イロハⅡ
	[ 1019 ] = {},					-- シャントットⅡ
}
    
return Spells

