;------------------------------------------------------------------------------
;-| ボタンリマップ|
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;------------------------------------------------------------------------------
;-| デフォルト設定 |
[Defaults]
command.time		= 15
command.buffer.time	= 1

;-| 超必殺技 |-----------------------------------------------------------------
[Command]
name = "blank"
command = ~F, B, DB, D, DF, F, a
time = 25

[Command]
name = "blank"
command = ~F, B, DB, D, DF, F, b
time = 25

[Command]
name = "blank"
command = ~D, DF, F, D, DF, F, x
time = 20

[Command]
name = "blank"
command = ~D, DF, F, D, DF, F, y
time = 20

[Command]
name = "blank"
command = ~D, DB, B, D, DB, B, x
time = 20

[Command]
name = "blank"
command = ~D, DB, B, D, DB, B, y
time = 20

[Command];じこさいせい
name    = "jikosaisei"
command = D, D, a + b
time    = 25

;------------------------------------------------------------------------------
;-| 必殺技 |-------------------------------------------------------------------

[Command]
name = "blank"
command = ~F, D, DF, x

[Command]
name = "blank"
command = ~F, D, DF, y

[Command]
name = "blank"
command = ~F, D, DF, x+y

[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b

;---------------------------
;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F, F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B, B
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

[Command]
name = "recovery" ;必須コマンド名
command = x+y
time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;------------------------------------------------------------------------------
;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1


[Statedef -1] ;←この行は消さない

;==============================================================================
; 超必殺技
;==============================================================================
[State -1, じこさいせい]
type       = ChangeState
value      = 3000
triggerall = command = "jikosaisei" && statetype != A && ctrl
trigger1   = power  >= 2000
trigger2   = power  >= powermax 

[State -1, みずのはどう（弱）]
type		= ChangeState
value		= 1000
triggerall	= command = "QCF_a"
triggerall	= NumProjID(1005) < 2
;trigger1	= statetype = S
trigger1	= ctrl

[State -1, みずのはどう（強）]
type		= ChangeState
value		= 1010
triggerall	= command = "QCF_b"
triggerall	= NumProjID(1005) < 2
trigger1	= statetype = S
trigger1	= ctrl

;==============================================================================
; 移動関連
;==============================================================================
[State -1, 走る]
type = ChangeState
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, うしろすべり]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, うえ]
type = ChangeState
value = 40
trigger1 = command = "holdup"
trigger1 = statetype = S
trigger1 = ctrl

;==============================================================================
; 通常攻撃技
;==============================================================================
[State -1, どろかけ（弱）]
type = ChangeState
value = 200
triggerall	= command = "x"
triggerall	= command != "holddown" && command != "holdup"
trigger1	= statetype = S
trigger1	= ctrl
trigger2	= (stateno = 200) && time > 9

[State -1, どろかけ（強）]
type = ChangeState
value = 210
triggerall	= command = "y"
triggerall	= command != "holddown" && command != "holdup"
trigger1	= statetype = S
trigger1	= ctrl
trigger2	= (stateno = 200) && time > 10
trigger3	= (stateno = 220) && time > 7
trigger4	= (stateno = 610) && time >= 7

[State -1, めざめるパワー（弱）]
type = ChangeState
value = 250
triggerall = command = "a"
triggerall = (command != "holddown") && (command != "holdup")
trigger1 = statetype = S
trigger1 = ctrl

[State -1, めざめるパワー（強）]
type = ChangeState
value = 260
triggerall = command = "b"
triggerall = (command != "holddown") && (command != "holdup")
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 250) && time > 13

;------------------------------------------------------------------------------
[State -1, 挑発]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A && ctrl && NumProjID(195) < 1

;------------------------------------------------------------------------------
[State -1, どろあそび（弱）]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) && (time > 10)

[State -1, どろあそび（強）]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, 下めざパ（弱）]
type = ChangeState
value = 450
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

[State -1, 下めざパ（強）]
type = ChangeState
value = 460
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 450) && time > 13

;------------------------------------------------------------------------------
[State -1, 上泥かけ(弱)]
type	= ChangeState
value		= 600
triggerall	= command = "holdup"
triggerall	= command = "x"
trigger1	= stateno = 30
trigger2	= stateno = 400 && time >= 7

[State -1, 上泥かけ（強）]
type	= ChangeState
value		= 610
triggerall	= command = "holdup"
triggerall	= command = "y"
trigger1	= stateno = 30
trigger2	= stateno = 200 && time > 10
trigger3	= stateno = 600 && time >= 7


[State -1, 上めざパ（弱）]
type	= ChangeState
value		= 650
triggerall	= command = "holdup"
triggerall	= command = "a"
trigger1	= stateno = 30

[State -1, 上めざパ（強）]
type	= ChangeState
value		= 660
triggerall	= command = "holdup"
triggerall	= command = "b"
trigger1	= stateno = 30
trigger2	= stateno = 650 && time > 13

