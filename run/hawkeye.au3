; Configuration
global const $kAttackSkillTimeout = 10
global const $kAttackTimeout = 20
global const $kMoveTimeout = 40
global const $kTimeouts = "16,20"
global const $kTimeoutHandlers = "OnBuffTimeout,CustomScript"
global const $kIsCancelTargetMove = false
global const $kDelayRate = 1
global const $kIsRestEnable = false
global const $kIsMacroSearch = false

; Skills
global const $kAttackSkill = "{F2}"
global const $kBuffKey = "{F7}"
global const $kDefenseSkill = "{F4}"
global const $kMeleeAttackKey = "{F3}"

func OnAttack()
endfunc

func OnAttackSkill()
	if not IsManaLess($kBarCritical) then
		SendClient($kAttackSkill, 1000)
	endif
endfunc

func OnFirstKill()
endfunc

func OnAllKill()
	SendClient($kMeleeAttackKey, 2500)
	PickDrop(5)
endfunc

func NextTarget()
	LogWrite("NextTarget()")
	SendClient($kNextTargetKey, 800)
endfunc

func OnAttackTimeout()
	SendClient($kCancelTarget, 50)
	ChangePosition()
endfunc

func OnBuffTimeout()
	LogWrite("OnBuffTimeout()")
	SendClient($kBuffKey, 5000)
endfunc

func OnCheckHealthAndMana()
	if IsHealthLess($kBarCritical) then
		SendClient($kDefenseSkill, 1000)
	endif
	
	if IsHealthLess($kBarHalf) then
		HealthPotion()
	endif
	
	if IsManaLess($kBarThird) then
		ManaPotion()
	endif
endfunc

#include "../tactics/solo.au3"