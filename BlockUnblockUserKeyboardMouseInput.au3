#RequireAdmin
#include <AutoItConstants.au3>
#include <Misc.au3>

; Vars...
Local $aPos = MouseGetPos()
Local $waitTimeMs = 10000
Local $sleepTimeMs = 1000
Local $elapsedTimeMs = 0
Local $elapsedTimePctg = 0

; Lock...
_MouseTrap( $aPos[0], $aPos[1], $aPos[0], $aPos[1] )
MouseMove( $aPos[0], $aPos[1], 0 )
BlockInput( $BI_DISABLE )

; UI On...
ProgressOn( "Please Wait", "Please Wait", "" );

; Wait...
While ( $elapsedTimeMs < $waitTimeMs )

	$elapsedTimeMs += $sleepTimeMs
	$elapsedTimePctg = 100 * ( $elapsedTimeMs / $waitTimeMs )
	Sleep( $sleepTimeMs )
	ProgressSet( $elapsedTimePctg, ( "" & $elapsedTimePctg & "%" ) )

WEnd

; Unlock...
_MouseTrap()
BlockInput( $BI_ENABLE  )

; UI Off...
ProgressOff()
