; Skills
global const $kAttackSkill = "{F2}"
global const $kStunSkill = "{F2}"
global const $kHealSkill = "{F6}"

func OnAttack()
	if not IsManaCritical() then
		;SendClient($kStunSkill, 1000)
	endif
endfunc

func OnAttackSkill()
	if not IsManaCritical() then
		SendClient($kAttackSkill, 1000)
	endif
endfunc

func OnFirstKill()
endfunc

func OnAllKill()
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
endfunc

func OnHealthCritical()
	if not IsManaCritical() then
		SendClient($kHealSkill, 8000)
	else
		PotionHealing()
	endif
endfunc