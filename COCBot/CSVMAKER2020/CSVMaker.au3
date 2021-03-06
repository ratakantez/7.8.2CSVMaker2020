
; #FUNCTION# ====================================================================================================================
; Name ..........: CSV Maker MainGuiFunctions
; Description ...:
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........: ratakantez
; Modified ......: ratakantez (17th October 2019)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2019
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......: MyBOT
; Link ..........:
; Example .......:
; ===============================================================================================================================

Func OpenPlace()
   	If Not FileExists(@ScriptDir & "\CSV\CSVMakerFiles") Then DirCreate(@ScriptDir & "\CSV\CSVMakerFiles")
	  $g_sSaveLocation = @ScriptDir & "\CSV\CSVMakerFiles\" & GUICtrlRead($FileInput) & ".csv"
	For $Filenumber = 1 To $infinity
		if FileExists($g_sSaveLocation) Then
			$g_sSaveLocation = @ScriptDir & "\CSV\CSVMakerFiles\" & GUICtrlRead($FileInput) & "_" & $Filenumber & ".csv"
		EndIf
		if not FileExists($g_sSaveLocation) Then
			ExitLoop
		EndIf

	Next
FileOpen($g_sSaveLocation,0)
EndFunc

Func StartButton()

	GetSidePoint()
	If $ForcedSideCSV = "|           " And $SideSUM = 0 Then
		MsgBox($MB_OK,"NO SIDE DETECTED", "You didn't decide your attack side, if you don't have any decision, Choose Random and Start")
	Else
		OpenPlace() ;Create CSV File
		ADDNotes()  ;Add Notes to CSV
		SetTrain()  ;SET Train Settings
;~ ---------------WRITE TRAIN and CCREQUESt SETTINGS TO CSV FILE #START----------------
		If Not $TrainCSVWrite = "" Then
			FileWrite($g_sSaveLocation,$TrainEnter)
			FileWrite($g_sSaveLocation, @CRLF)
			FileWrite($g_sSaveLocation,$TrainCSVWrite)
			FileWrite($g_sSaveLocation, @CRLF)
			FileWrite($g_sSaveLocation, @CRLF)
		Else
			FileWrite($g_sSaveLocation, @CRLF)
		EndIf

		GetRequestCC();Get CC Request if it is filled

		If Not $CCRequestCSVWrite = "" Then ; Write CCRequest to CSV if it is filled
			FileWrite($g_sSaveLocation,$CCRequestCSVEnter)
			FileWrite($g_sSaveLocation, @CRLF)
			FileWrite($g_sSaveLocation,$CCRequestCSVWrite)
			FileWrite($g_sSaveLocation, @CRLF)
			FileWrite($g_sSaveLocation, @CRLF)
		Else
			FileWrite($g_sSaveLocation, @CRLF)
		EndIf
;~ ---------------WRITE TRAIN SETTINGS TO CSV FILE #END----------------
		GetSidePoint()
		ADDSides() ;Add Side Dicision to CSV

;~ !!!!!!!!!!!!!!!MAKE AND DROP COMMANDS WILL BE ADD AFTER "ADD CSV BUTTON"!!!!!!!!!!!

		;GuiControl After Start
		AfterStart()
		_GUICtrlRichEdit_AppendText($LOG,"Your Notes added to CSV File : " & $g_sSaveLocation & @CRLF)
		_GUICtrlRichEdit_AppendText($LOG,"Your Sides added to CSV File : " & $g_sSaveLocation & @CRLF)
		_GUICtrlRichEdit_AppendText($LOG,"Your Train Settings added to CSV File : " & $g_sSaveLocation & @CRLF)
		_GUICtrlRichEdit_AppendText($LOG,"For Seeing CSV File, You can use HOT KEY ' ALT + F '" & @CRLF)
		_GUICtrlRichEdit_AppendText($LOG,"For Closing CSV File, You can use HOT KEY ' ALT + D '" & @CRLF)

	EndIf
EndFunc



Func ComboRandomnessCombo()

	Switch _GUICtrlComboBox_GetCurSel($RandomnessSlider)
		case 0
			GUICtrlSetState($RandomnessSliderImage0,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		Case 1
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 2
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 3
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 4
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 5
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 6
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 7
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_SHOW)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_HIDE)
		case 8
			GUICtrlSetState($RandomnessSliderImage0,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage1,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage2,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage3,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage4,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage5,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage6,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage7,$GUI_HIDE)
			GUICtrlSetState($RandomnessSliderImage8,$GUI_SHOW)
	EndSwitch

EndFunc

Func CheckWaitCheckBOX()
	if GUICtrlRead($CheckWait) = $GUI_CHECKED Then
		GuiCtrlSetState($WaitInput1,$GUI_ENABLE)
		GuiCtrlSetState($lblWait,$GUI_ENABLE)
		GuiCtrlSetState($WaitInput2,$GUI_ENABLE)
		GuiCtrlSetState($lblWait2,$GUI_ENABLE)
		GuiCtrlSetState($CMBWaitBreakCommand,$GUI_ENABLE)
	Else
		GuiCtrlSetState($WaitInput1,$GUI_DISABLE)
		GuiCtrlSetState($lblWait,$GUI_DISABLE)
		GuiCtrlSetState($WaitInput2,$GUI_DISABLE)
		GuiCtrlSetState($lblWait2,$GUI_DISABLE)
		GuiCtrlSetState($CMBWaitBreakCommand,$GUI_DISABLE)
	 EndIf
EndFunc

Func InfoAfterStartButton()
	;~ 			 _ControlMouseClick("CSV MAKER v1.0", "" , $CMBTroops_Name, $iButton = "left", $iClicks = "1", $iSpeed = "12", $iXpos = "", $iYpos = "")
			   Local $TextforHelp
			   $TextforHelp = _
			   "WellCome to CSV MAKER program" & @CRLF & _
			   "After setting your side, train and notes, you are in 'droping of army and spell' part at program" & @CRLF & _
			   "Please follow the instructions in sequence " & @CRLF & _
			   "1st >> Please choose an army or spell which you will use in 'Drop option" & @CRLF & _
			   "2nd >> Please choose a suitible drop point on the map." & @CRLF & _
			   "       Here, if you choose spell you will choose a drop point from blue buttons." & @CRLF & _
			   "             if you choose 'Drop on Building' too, Choosing a building is enough." & @CRLF & _
			   "             if you check 'Sleep' bot will wait randomly between your inputs AFTER DROPPING" & @CRLF & _
			   "    Besides, if you choose Ground or Air Troop you will choose a drop point from red buttons" & @CRLF & _
			   "             After choosing drop point you must choose an addtile. Each Addtile is far 1 suare from Red Line" & @CRLF & _
			   "             Of course you can set 'Sleep' time for your army as spell" & @CRLF & _
			   "If you choose drop point and addtile, now you can press ADD CSV to add this attack to your csv file." & @CRLF & _
			   "If you make mistake you can undo your last attack by clicking 'UNDO'" & @CRLF & _
			   "Wait checkbox is same with sleep function, but if you want to break your wait time, it is better than 'Sleep' with extra option." & @CRLF & _
			   "If you check both 'Sleep' and 'Wait', first bot DROPS ARMY, waits 'sleep time' and then waits 'wait time'." & @CRLF & _
			   "   So bot wait sum of Sleep and Wait time." & @CRLF & _
			   "You can set attacks only for 1 army unit each time. You can look your used army at right side of the program for size of army." & @CRLF & _
			   "If you have any idea what CSV is, you can check your CSV file with HOT KEY command. "& @CRLF & _
			   "Alt + F show your final writing of your CSV with NotePad. " & @CRLF & _
			   "Alt + D close your final writing." & @CRLF & _
			   "Please close your csv file after seeing to continue."
			   ShellExecute("https://www.youtube.com/watch?v=fZnRzF9EiEI&list=PLmIv-oiz2PdDUq_UJC01bF_07q32CKJJd&index=1")

;~ 			   MsgBox($MB_OK,"INFO FOR DROPING", $TextforHelp, 150)

EndFunc

Func CMBWaitBreakCommandCOMBOBOX()

	Switch _GUICtrlComboBox_GetCurSel($CMBWaitBreakCommand)
		case 0
			$WaitCommand = "           "
		case 1
			$WaitCommand = "TH         "
		case 2
			$WaitCommand = "SIEGE      "
		case 3
			$WaitCommand = "TH+SIEGE   "
		case 4
			$WaitCommand = "TH,SIEGE   "
		case 5
			$WaitCommand = "BK         "
		Case 6
			$WaitCommand = "AQ         "
		case 7
			$WaitCommand = "GW         "
		case 8
			$WaitCommand = "RC         "
		case 9
			$WaitCommand = "AQ+BK      "
		case 10
			$WaitCommand = "AQ,BK      "
	EndSwitch

EndFunc

Func AddRandomXandY()
	If GUICtrlRead($AddRandomXandY) = $GUI_CHECKED Then
		GUICtrlSetState($txtRandomX,$GUI_ENABLE)
		GUICtrlSetState($lblRandomXY1,$GUI_ENABLE)
		GUICtrlSetState($txtRandomY,$GUI_ENABLE)
		Local $txt = "RANDOM X and RANDOM Y are the amount of randomness to use when dropping. If you have a randomx of "&GUICtrlRead($txtRandomX)&" and a randomy of "&GUICtrlRead($txtRandomY)&", then the bot will drop each troop between [droppointX-"&GUICtrlRead($txtRandomX)&", droppointY-"&GUICtrlRead($txtRandomY)&"] and [droppointX+"&GUICtrlRead($txtRandomX)&", droppointY+"&GUICtrlRead($txtRandomY)&"]. A higher randomness amount may make the bot look more humanlike, but this is only for spell for now."
		MsgBox($MB_OK,"WARNING",$txt,15)
	Else
		GUICtrlSetState($txtRandomX,$GUI_DISABLE)
		GUICtrlSetState($lblRandomXY1,$GUI_DISABLE)
		GUICtrlSetState($txtRandomY,$GUI_DISABLE)
	EndIf
EndFunc

Func CMBTroops_NameCOMBOBOX()
	Switch _GUICtrlComboBox_GetCurSel($CMBTroops_Name)
		Case 0
			$TName = "Barb       "
			$TType = "Army"
			$LOGName = "Barbarian"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Barbarian.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 1
		case 1
			$TName = "Arch       "
			$TType = "Army"
			$LOGName = "Archer"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Archer.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 1
		case 2
			$TName = "Giant      "
			$TType = "Army"
			$LOGName = "Giant"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Giant.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 5
		case 3
			$TName = "Gobl       "
			$TType = "Army"
			$LOGName = "Goblin"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Goblin.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 1
		Case 4
			$TName = "Wall       "
			$TType = "Army"
			$LOGName = "Wall Breaker"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\WallBreaker.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 2
		case 5
			$TName = "Ball       "
			$TType = "Army"
			$LOGName = "Baloon"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Baloon.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 5
		case 6
			$TName = "Wiza       "
			$TType = "Army"
			$LOGName = "Wizard"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Wizard.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 4
		Case 7
			$TName = "Heal       "
			$TType = "Army"
			$LOGName = "Healer"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Healer.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 14
		case 8
			$TName = "Drag       "
			$TType = "Army"
			$LOGName = "Dragon"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Dragon.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 20
		case 9
			$TName = "Pekk       "
			$TType = "Army"
			$LOGName = "P.E.K.K.A"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Pekka.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 25
		Case 10
			$TName = "BabyD      "
			$TType = "Army"
			$LOGName = "Baby Dragon"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\BabyDragon.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 10
		case 11
			$TName = "Mine       "
			$TType = "Army"
			$LOGName = "Miner"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Miner.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 6
		case 12
			$TName = "EDrag      "
			$TType = "Army"
			$LOGName = "Electro Dragon"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\EDrag.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 30
		case 13
			$TName = "Yeti       "
			$TType = "Army"
			$LOGName = "Yeti"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Yeti.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 18
		Case 14
			$TName = "Mini       "
			$TType = "Army"
			$LOGName = "Minion"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Minion.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 2
		case 15
			$TName = "Hogs       "
			$TType = "Army"
			$LOGName = "Hog Rider"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\HogRider.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 5
		case 16
			$TName = "Valk       "
			$TType = "Army"
			$LOGName = "Valkyre"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Valkyre.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 8
		Case 17
			$TType = "Army"
			$TName = "Gole       "
			$LOGName = "Golem"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Golem.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 30
		case 18
			$TType = "Army"
			$TName = "Witc       "
			$LOGName = "Witch"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Witch.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 12
		case 19
			$TType = "Army"
			$TName = "Lava       "
			$LOGName = "Lava Hound"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Lava.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 30
		Case 20
			$TType = "Army"
			$TName = "Bowl       "
			$LOGName = "Bowler"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Bowler.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			$CounterTroop_TroopSize = 6
		case 21
			$TType = "Army"
			$TName = "IceG       "
			$LOGName = "Ice Golem"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\IceGolem.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_TroopSize = 15
		case 22
			$TType = "Spell"
			$TName = "LSpell     "
			$LOGName = "Light Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\LSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 2
		Case 23
			$TType = "Spell"
			$TName = "HSpell     "
			$LOGName = "Heal Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\HSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 2
		case 24
			$TType = "Spell"
			$TName = "RSpell     "
			$LOGName = "Rage Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\RSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 2
		case 25
			$TType = "Spell"
			$TName = "JSpell     "
			$LOGName = "Jump Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\JSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 2
		Case 26
			$TType = "Spell"
			$TName = "FSpell     "
			$LOGName = "Freeze Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\FSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 1
		case 27
			$TType = "Spell"
			$TName = "CSpell     "
			$LOGName = "Clone Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\CSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
			DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 3
		case 28
			$TType = "Spell"
			$TName = "PSpell     "
			$LOGName = "Poison Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\PSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 1
		Case 29
			$TType = "Spell"
			$TName = "ESpell     "
			$LOGName = "Earthquake Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\ESpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 1
		case 30
			$TType = "Spell"
			$TName = "HaSpell    "
			$LOGName = "Haste Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\HaSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 1
		case 31
			$TType = "Spell"
			$TName = "SkSpell    "
			$LOGName = "Skeleton Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\SkSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 1
		Case 32
			$TType = "Spell"
			$TName = "BtSpell    "
			$LOGName = "Bat Spell"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\BtSpell.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSORSPELL')
			OnAutoItExitRegister('OnAutoItExit')
			If GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				DisableBuildings()
			EndIf
			$CounterTroop_SpellSize = 1
		case 33
			$TType = "Army"
			$TName = "WallW      "
			$LOGName = "Wall Wrecker"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\WallW.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		case 34
			$TType = "Army"
			$TName = "BattleB    "
			$LOGName = "Battle Blimp"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\BattleB.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		Case 35
			$TType = "Army"
			$TName = "StoneS     "
			$LOGName = "Stone Slamer"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\StoneS.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		Case 36
			$TType = "Army"
			$TName = "SiegeB     "
			$LOGName = "Siege Barrack"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\SiegeB.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		case 37
			$TType = "Army"
			$TName = "King       "
			$LOGName = "King"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\King.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		case 38
			$TType = "Army"
			$TName = "Queen      "
			$LOGName = "Queen"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Queen.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		case 39
			$TType = "Army"
			$TName = "Warden     "
			$LOGName = "Warden"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Warden.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		case 40
			$TType = "Army"
			$TName = "Champion   "
			$LOGName = "Royal Champion"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\royal.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
		case 41
			$TType = "Army"
			$TName = "Castle     "
			$LOGName = "Clan Castle"
			$g_hCursor = _WinAPI_LoadCursorFromFile(@ScriptDir & '\COCBot\CSVMAKER2020\Cursor\Castle.cur')
			GUIRegisterMsg($WM_SETCURSOR, 'WM_SETCURSOR')
			OnAutoItExitRegister('OnAutoItExit')
	EndSwitch

	if $TName = "LSpell     " or $TName = "HSpell     " or $TName = "RSpell     " or  $TName = "JSpell     " or  $TName = "FSpell     " or  $TName = "CSpell     " or  $TName = "PSpell     " or  $TName = "ESpell     " or  $TName = "HaSpell    " or  $TName = "SkSpell    "  or  $TName = "BtSpell    " Then

		GUICtrlSetState($aAddTile0, $GUI_HIDE)
		GUICtrlSetState($aAddTile1, $GUI_HIDE)
		GUICtrlSetState($aAddTile2, $GUI_HIDE)
		GUICtrlSetState($CheckBuilding, $GUI_ENABLE)
		GUICtrlSetState($AddRandomXandY, $GUI_ENABLE)
		ShowBuildings()
		UncheckBuildings()
		GuiCtrlSetState($troops_pic,$GUI_HIDE)
		GuiCtrlSetState($troops_pic2,$GUI_SHOW)
		For $i = $a10 To $h1
			GUICtrlSetState($i,$GUI_DISABLE)
		Next

		For $i = $Se1L1 To $Sf1L17
			GUICtrlSetState($i,$GUI_ENABLE)
		Next

		GUICtrlSetBkColor($aAddTile0,0xFF0000)
		GUICtrlSetBkColor($aAddTile1,0xFF0000)
		GUICtrlSetBkColor($aAddTile2,0xFF0000)
		GUICtrlSetColor($aAddTile0, 0xFFFFFF)
		GUICtrlSetColor($aAddTile1, 0xFFFFFF)
		GUICtrlSetColor($aAddTile2, 0xFFFFFF)
		GUICtrlSetState($aAddTile0, $GUI_DISABLE)
		GUICtrlSetState($aAddTile1, $GUI_DISABLE)
		GUICtrlSetState($aAddTile2, $GUI_DISABLE)
		$AddTileChoose = True
		GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
		GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
		GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
		GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
		GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
		GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
		GUICtrlSetState($RandomnessSliderLabel,$GUI_DISABLE)
		GUICtrlSetState($RandomnessSliderLabel2,$GUI_DISABLE)
		GUICtrlSetState($RandomnessSlider,$GUI_DISABLE)
	Else
		GUICtrlSetState($aAddTile0, $GUI_HIDE)
		GUICtrlSetState($aAddTile1, $GUI_HIDE)
		GUICtrlSetState($aAddTile2, $GUI_HIDE)
		HideBuildings()
		DisableBuildings()
		GUICtrlSetState($CheckBuilding, $GUI_UNCHECKED)
		GUICtrlSetState($CheckBuilding, $GUI_DISABLE)
		GUICtrlSetState($AddRandomXandY, $GUI_DISABLE)
		GUICtrlSetState($AddRandomXandY, $GUI_UNCHECKED)
		GUICtrlSetState($RandomnessSliderLabel,$GUI_ENABLE)
		GUICtrlSetState($RandomnessSliderLabel2,$GUI_ENABLE)
		GUICtrlSetState($RandomnessSlider,$GUI_ENABLE)

		GuiCtrlSetState($troops_pic,$GUI_SHOW)
		GuiCtrlSetState($troops_pic2,$GUI_HIDE)
		For $i = $a10 To $h1
			GUICtrlSetState($i,$GUI_ENABLE)
		Next
		For $i = $Se1L1 To $Sf1L17
			GUICtrlSetState($i,$GUI_DISABLE)
		Next

		ShowSpellPoint()

		GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
		GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
		GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
		GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
		GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
		GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
        GUICtrlSetBkColor($aAddTile0,0xFF0000)
	    GUICtrlSetBkColor($aAddTile1,0xFF0000)
		GUICtrlSetBkColor($aAddTile2,0xFF0000)
		GUICtrlSetColor($aAddTile0, 0xFFFFFF)
		GUICtrlSetColor($aAddTile1, 0xFFFFFF)
		GUICtrlSetColor($aAddTile2, 0xFFFFFF)
		GUICtrlSetState($aAddTile0,$GUI_ENABLE)
		GUICtrlSetState($aAddTile1,$GUI_ENABLE)
		GUICtrlSetState($aAddTile2,$GUI_ENABLE)
		$AddTileChoose = False
	EndIf

	If not $TName = "" Then
	    GuiCtrlSetState($SleepInput1,$GUI_DISABLE)
		GuiCtrlSetState($SleepInput2,$GUI_DISABLE)
	    GuiCtrlSetState($Sleep,$GUI_UNCHECKED)
	EndIf

EndFunc

Func SleepCheckControl()

	if GUICtrlRead($Sleep) = $GUI_CHECKED Then
		GuiCtrlSetState($SleepInput1,$GUI_ENABLE)
		GuiCtrlSetState($SleepInput2,$GUI_ENABLE)
	Else
		GuiCtrlSetState($SleepInput1,$GUI_DISABLE)
		GuiCtrlSetState($SleepInput2,$GUI_DISABLE)
	EndIf
EndFunc

Func CheckBuildingControl()

	If GUICtrlRead($CheckBuilding) = $GUI_CHECKED Then
		EnableBuildings()
		UncheckBuildings()
		HideSpellPoint()
	Else
		DisableBuildings()
		UncheckBuildings()
		ShowSpellPoint()
	EndIf

EndFunc





Func a1()
	$SideNumber = 1
	$SideType = "_A"
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 127 + 10, $y + 86 + 10)
	GUICtrlSetPos($aAddTile1, $x - 127 + 10, $y + 86 + 40)
	GUICtrlSetPos($aAddTile2, $x - 127 + 10, $y + 86 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func a2()
	$SideNumber = 2
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 112 + 10, $y + 75 + 10)
	GUICtrlSetPos($aAddTile1, $x - 112 + 10, $y + 75 + 40)
	GUICtrlSetPos($aAddTile2, $x - 112 + 10, $y + 75 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func a3()
	$SideNumber = 3
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 97 + 10, $y + 66 + 10)
	GUICtrlSetPos($aAddTile1, $x - 97 + 10, $y + 66 + 40)
	GUICtrlSetPos($aAddTile2, $x - 97 + 10, $y + 66 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func a4()
	$SideNumber = 4
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 82 + 10, $y + 57 + 10)
	GUICtrlSetPos($aAddTile1, $x - 82 + 10, $y + 57 + 40)
	GUICtrlSetPos($aAddTile2, $x - 82 + 10, $y + 57 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func a5()
	$SideNumber = 5
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func a6()
	$SideNumber = 6
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 56 + 10, $y + 36 + 10)
	GUICtrlSetPos($aAddTile1, $x - 56 + 10, $y + 36 + 40)
	GUICtrlSetPos($aAddTile2, $x - 56 + 10, $y + 36 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func a7()
	$SideNumber = 7
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 43 + 10, $y + 27 + 10)
	GUICtrlSetPos($aAddTile1, $x - 43 + 10, $y + 27 + 40)
	GUICtrlSetPos($aAddTile2, $x - 43 + 10, $y + 27 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func a8()
	$SideNumber = 8
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 29 + 10, $y + 19 + 10)
	GUICtrlSetPos($aAddTile1, $x - 29 + 10, $y + 19 + 40)
	GUICtrlSetPos($aAddTile2, $x - 29 + 10, $y + 19 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func a9()
	$SideNumber = 9
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 29 + 10, $y + 19 + 10)
	GUICtrlSetPos($aAddTile1, $x - 29 + 10, $y + 19 + 40)
	GUICtrlSetPos($aAddTile2, $x - 29 + 10, $y + 19 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func a10()
	$SideNumber = 10
	$SideType = "_A"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $a10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 29 + 10, $y + 19 + 10)
	GUICtrlSetPos($aAddTile1, $x - 29 + 10, $y + 19 + 40)
	GUICtrlSetPos($aAddTile2, $x - 29 + 10, $y + 19 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc





Func aAddTile1()
	$AddTile = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	$GuiLastAddTilePoint = $aAddTile1
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastAddTilePoint, 0x000080) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER purple
	Sleep(150)
	GUICtrlSetState($aAddTile0,$GUI_HIDE)
	GUICtrlSetState($aAddTile1,$GUI_HIDE)
	GUICtrlSetState($aAddTile2,$GUI_HIDE)
EndFunc

Func aAddTile2()
	$AddTile = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	$GuiLastAddTilePoint = $aAddTile2
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastAddTilePoint, 0x000080) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER purple
	Sleep(150)
	GUICtrlSetState($aAddTile0,$GUI_HIDE)
	GUICtrlSetState($aAddTile1,$GUI_HIDE)
	GUICtrlSetState($aAddTile2,$GUI_HIDE)

EndFunc

Func aAddTile0()
	$AddTile = 0
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	$GuiLastAddTilePoint = $aAddTile0
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastAddTilePoint, 0x000080) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER purple
	Sleep(150)
	GUICtrlSetState($aAddTile0,$GUI_HIDE)
	GUICtrlSetState($aAddTile1,$GUI_HIDE)
	GUICtrlSetState($aAddTile2,$GUI_HIDE)

EndFunc




Func b10()
	$SideNumber = 10
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func b9()
	$SideNumber = 9
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func b8()
	$SideNumber = 8
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func b7()
	$SideNumber = 7
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc




Func b6()
	$SideNumber = 6
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func b5()
	$SideNumber = 5
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 56 + 10, $y + 36 + 10)
	GUICtrlSetPos($aAddTile1, $x - 56 + 10, $y + 36 + 40)
	GUICtrlSetPos($aAddTile2, $x - 56 + 10, $y + 36 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func b4()
	$SideNumber = 4
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 43 + 10, $y + 27 + 10)
	GUICtrlSetPos($aAddTile1, $x - 43 + 10, $y + 27 + 40)
	GUICtrlSetPos($aAddTile2, $x - 43 + 10, $y + 27 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func b3()

	$SideNumber = 3
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 29 + 10, $y + 19 + 10)
	GUICtrlSetPos($aAddTile1, $x - 29 + 10, $y + 19 + 40)
	GUICtrlSetPos($aAddTile2, $x - 29 + 10, $y + 19 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func b2()

	$SideNumber = 2
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 14 + 10, $y + 11 + 10)
	GUICtrlSetPos($aAddTile1, $x - 14 + 10, $y + 11 + 40)
	GUICtrlSetPos($aAddTile2, $x - 14 + 10, $y + 11 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func b1()
	$SideNumber = 1
	$SideType = "_B"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $b1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x + 10, $y + 10)
	GUICtrlSetPos($aAddTile1, $x + 10, $y + 40)
	GUICtrlSetPos($aAddTile2, $x + 10, $y + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func bAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($bAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($bAddTile1, 0x000080)
EndFunc


Func bAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($bAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($bAddTile2, 0x000080)
EndFunc

Func bAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($bAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($bAddTile0, 0x000080)
EndFunc

Func c10()
	$SideNumber = 10
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func c9()
	$SideNumber = 9
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func c8()
	$SideNumber = 8
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func c7()
	$SideNumber = 7
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

		GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 312
	Local $y = 160
	GUICtrlSetPos($aAddTile0, $x - 69 + 10, $y + 47 + 10)
	GUICtrlSetPos($aAddTile1, $x - 69 + 10, $y + 47 + 40)
	GUICtrlSetPos($aAddTile2, $x - 69 + 10, $y + 47 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func c6()
	$SideNumber = 6
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 183
	Local $y = 262
	GUICtrlSetPos($aAddTile0, $x + 56 + 10, $y + 41 - 21)
	GUICtrlSetPos($aAddTile1, $x + 56 + 10, $y + 41 - 51)
	GUICtrlSetPos($aAddTile2, $x + 56 + 10, $y + 41 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func c5()
	$SideNumber = 5
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 183
	Local $y = 262
	GUICtrlSetPos($aAddTile0, $x + 72 + 10, $y + 50 - 21)
	GUICtrlSetPos($aAddTile1, $x + 72 + 10, $y + 50 - 51)
	GUICtrlSetPos($aAddTile2, $x + 72 + 10, $y + 50 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func c4()
	$SideNumber = 4
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

		GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 183
	Local $y = 262
	GUICtrlSetPos($aAddTile0, $x + 86 + 10, $y + 59 - 21)
	GUICtrlSetPos($aAddTile1, $x + 86 + 10, $y + 59 - 51)
	GUICtrlSetPos($aAddTile2, $x + 86 + 10, $y + 59 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func c3()
	$SideNumber = 3
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 183
	Local $y = 262
	GUICtrlSetPos($aAddTile0, $x + 99 + 10, $y + 69 - 21)
	GUICtrlSetPos($aAddTile1, $x + 99 + 10, $y + 69 - 51)
	GUICtrlSetPos($aAddTile2, $x + 99 + 10, $y + 69 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func c2()
	$SideNumber = 2
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 183
	Local $y = 262
	GUICtrlSetPos($aAddTile0, $x + 111 + 10, $y + 77 - 21)
	GUICtrlSetPos($aAddTile1, $x + 111 + 10, $y + 77 - 51)
	GUICtrlSetPos($aAddTile2, $x + 111 + 10, $y + 77 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func c1()
	$SideNumber = 1
	$SideType = "_C"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $c1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 183
	Local $y = 262
	GUICtrlSetPos($aAddTile0, $x + 123 + 10, $y + 85 - 21)
	GUICtrlSetPos($aAddTile1, $x + 123 + 10, $y + 85 - 51)
	GUICtrlSetPos($aAddTile2, $x + 123 + 10, $y + 85 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc






Func cAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($cAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($cAddTile1, 0x000080)
EndFunc


Func cAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($cAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($cAddTile2, 0x000080)
EndFunc

Func cAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($cAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($cAddTile0, 0x000080)
EndFunc



Func d1()
	$SideNumber = 1
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 10, $y - 21)
	GUICtrlSetPos($aAddTile1, $x + 10, $y - 51)
	GUICtrlSetPos($aAddTile2, $x + 10, $y - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func d2()
	$SideNumber = 2
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 14 + 10, $y + 10 - 21)
	GUICtrlSetPos($aAddTile1, $x + 14 + 10, $y + 10 - 51)
	GUICtrlSetPos($aAddTile2, $x + 14 + 10, $y + 10 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func d3()
	$SideNumber = 3
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 29 + 10, $y + 21 - 21)
	GUICtrlSetPos($aAddTile1, $x + 29 + 10, $y + 21 - 51)
	GUICtrlSetPos($aAddTile2, $x + 29 + 10, $y + 21 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func d4()
	$SideNumber = 4
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 43 + 10, $y + 32 - 21)
	GUICtrlSetPos($aAddTile1, $x + 43 + 10, $y + 32 - 51)
	GUICtrlSetPos($aAddTile2, $x + 43 + 10, $y + 32 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func d5()
	$SideNumber = 5
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 56 + 10, $y + 41 - 21)
	GUICtrlSetPos($aAddTile1, $x + 56 + 10, $y + 41 - 51)
	GUICtrlSetPos($aAddTile2, $x + 56 + 10, $y + 41 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func d6()
	$SideNumber = 6
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 72 + 10, $y + 50 - 21)
	GUICtrlSetPos($aAddTile1, $x + 72 + 10, $y + 50 - 51)
	GUICtrlSetPos($aAddTile2, $x + 72 + 10, $y + 50 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func d7()
	$SideNumber = 7
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 86 + 10, $y + 59 - 21)
	GUICtrlSetPos($aAddTile1, $x + 86 + 10, $y + 59 - 51)
	GUICtrlSetPos($aAddTile2, $x + 86 + 10, $y + 59 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func d8()
	$SideNumber = 8
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 99 + 10, $y + 69 - 21)
	GUICtrlSetPos($aAddTile1, $x + 99 + 10, $y + 69 - 51)
	GUICtrlSetPos($aAddTile2, $x + 99 + 10, $y + 69 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func d9()
	$SideNumber = 9
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 99 + 10, $y + 69 - 21)
	GUICtrlSetPos($aAddTile1, $x + 99 + 10, $y + 69 - 51)
	GUICtrlSetPos($aAddTile2, $x + 99 + 10, $y + 69 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func d10()
	$SideNumber = 10
	$SideType = "_D"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $d10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 99 + 10, $y + 69 - 21)
	GUICtrlSetPos($aAddTile1, $x + 99 + 10, $y + 69 - 51)
	GUICtrlSetPos($aAddTile2, $x + 99 + 10, $y + 69 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)


EndFunc


Func dAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($dAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($dAddTile1, 0x000080)

EndFunc

Func dAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($dAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($dAddTile2, 0x000080)
EndFunc

Func dAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($dAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($dAddTile0, 0x000080)

EndFunc


Func e1()
	$SideNumber = 1
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 1 - 60, $y - 21)
	GUICtrlSetPos($aAddTile1, $x - 1 - 60, $y - 51)
	GUICtrlSetPos($aAddTile2, $x - 1 - 60, $y - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func e2()
	$SideNumber = 2
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 15 - 60, $y + 10 - 21)
	GUICtrlSetPos($aAddTile1, $x - 15 - 60, $y + 10 - 51)
	GUICtrlSetPos($aAddTile2, $x - 15 - 60, $y + 10 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func e3()
	$SideNumber = 3
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 29 - 60, $y + 19 - 21)
	GUICtrlSetPos($aAddTile1, $x - 29 - 60, $y + 19 - 51)
	GUICtrlSetPos($aAddTile2, $x - 29 - 60, $y + 19 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc




Func e4()
	$SideNumber = 4
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 43 - 60, $y + 27 - 21)
	GUICtrlSetPos($aAddTile1, $x - 43 - 60, $y + 27 - 51)
	GUICtrlSetPos($aAddTile2, $x - 43 - 60, $y + 27 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func e5()
	$SideNumber = 5
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 56 - 60, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 60, $y + 36 - 51)
	GUICtrlSetPos($aAddTile2, $x - 56 - 60, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func e6()
	$SideNumber = 6
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 69 - 60, $y + 47 - 21)
	GUICtrlSetPos($aAddTile1, $x - 69 - 60, $y + 47 - 51)
	GUICtrlSetPos($aAddTile2, $x - 69 - 60, $y + 47 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func e7()
	$SideNumber = 7
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 82 - 60, $y + 57 - 21)
	GUICtrlSetPos($aAddTile1, $x - 82 - 60, $y + 57 - 51)
	GUICtrlSetPos($aAddTile2, $x - 82 - 60, $y + 57 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)


EndFunc



Func e8()
	$SideNumber = 8
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 593
	Local $y = 359
	GUICtrlSetPos($aAddTile0, $x - 97 - 60, $y + 66 - 21)
	GUICtrlSetPos($aAddTile1, $x - 97 - 60, $y + 66 - 51)
	GUICtrlSetPos($aAddTile2, $x - 97 - 60, $y + 66 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func e9()
	$SideNumber = 9
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 99 + 10, $y + 69 - 21)
	GUICtrlSetPos($aAddTile1, $x + 99 + 10, $y + 69 - 51)
	GUICtrlSetPos($aAddTile2, $x + 99 + 10, $y + 69 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func e10()
	$SideNumber = 10
	$SideType = "_E"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $e10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 322
	Local $y = 361
	GUICtrlSetPos($aAddTile0, $x + 99 + 10, $y + 69 - 21)
	GUICtrlSetPos($aAddTile1, $x + 99 + 10, $y + 69 - 51)
	GUICtrlSetPos($aAddTile2, $x + 99 + 10, $y + 69 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)


EndFunc



Func eAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($eAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($eAddTile1, 0x000080)
EndFunc


Func eAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($eAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($eAddTile2, 0x000080)
EndFunc

Func eAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($eAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($eAddTile0, 0x000080)
EndFunc



;$Se10L1 = HIDED
Func Se2L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000) ;RED
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF) ;text White
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;text yellow
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ; blue
	$GuiLastSpellPoint = $Se2L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080) ; text purple
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00) ; yellow
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; text white
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;red
EndFunc

Func Se3L1()
	$SpellSideNumber = 3
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L1()
	$AddTile = "-4"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

;$Se10L2 = HIDED
Func Se2L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se3L2()
	$SpellSideNumber = 3
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L2()
	$AddTile = "-6"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

;$Se10L3 = HIDED
EndFunc
Func Se2L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se3L3()
	$SpellSideNumber = 3
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se4L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se5L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se7L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L3()
	$AddTile = "-8"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


;$Se10L4 = HIDED
EndFunc
Func Se2L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se3L4()
	$SpellSideNumber = 3
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se9L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L4()
	$AddTile = "-10"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc




;$Se10L5 = HIDED
Func Se2L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L5()
	$SpellSideNumber = 3
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se7L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L5()
	$AddTile = "-12"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc



;$Se10L6 = HIDED
Func Se2L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L6()
	$SpellSideNumber = 3
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se7L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L6()
	$AddTile = "-14"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


;$Se10L7 = HIDED
EndFunc
Func Se2L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se3L7()
	$SpellSideNumber = 3
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se7L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L7()
	$AddTile = "-16"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc

;$Se10L8 = HIDED
Func Se2L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L8()
	$SpellSideNumber = 3
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L8()
	$AddTile = "-18"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc


;$Se10L9 = HIDED
Func Se2L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L9()
	$SpellSideNumber = 3
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc

Func Se9L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L9()
	$AddTile = "-20"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc

;$Se10L10 = HIDED
Func Se2L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L10()
	$SpellSideNumber = 3
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se4L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se7L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se9L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L10()
	$AddTile = "-22"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)



EndFunc

;$Se10L11 = HIDED
Func Se2L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L11()
	$SpellSideNumber = 3
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se9L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L11()
	$AddTile = "-24"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


EndFunc


;$Se10L12 = HIDED
Func Se2L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L12()
	$SpellSideNumber = 3
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se9L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L12()
	$AddTile = "-26"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc


;$Se10L13 = HIDED
Func Se2L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L13()
	$SpellSideNumber = 3
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L13()
	$AddTile = "-28"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc


;$Se10L14 = HIDED
Func Se2L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L14()
	$SpellSideNumber = 3
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se8L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se9L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L14()
	$AddTile = "-30"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


EndFunc

;$Se10L15 = HIDED
Func Se2L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se3L15()
	$SpellSideNumber = 3
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L15()
	$AddTile = "-32"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc


;$Se10L16 = HIDED

Func Se2L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se3L16()
	$SpellSideNumber = 3
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se4L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se5L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se7L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Se9L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L16()
	$AddTile = "-34"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc




;$Se10L17 = HIDED
Func Se2L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se2L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se3L17()
	$SpellSideNumber = 3
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se3L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se4L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se4L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se5L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se5L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se6L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se6L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se7L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se7L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se8L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se8L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Se9L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se9L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Se1L17()
	$AddTile = "-36"
	$SpellSideType = "_SE"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Se1L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)



EndFunc
Func f10()
	$SideNumber = 10
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)


EndFunc
Func f9()
	$SideNumber = 9
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)



EndFunc
Func f8()
	$SideNumber = 8
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func f7()
	$SideNumber = 7
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func f6()
	$SideNumber = 6
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func f5()
	$SideNumber = 5
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 69 - 60, $y + 47 - 21)
	GUICtrlSetPos($aAddTile1, $x - 69 - 60, $y + 47 - 51)
	GUICtrlSetPos($aAddTile2, $x - 69 - 60, $y + 47 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func f4()
	$SideNumber = 4
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 82 - 60, $y + 57 - 21)
	GUICtrlSetPos($aAddTile1, $x - 82 - 60, $y + 57 - 51)
	GUICtrlSetPos($aAddTile2, $x - 82 - 60, $y + 57 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func f3()
	$SideNumber = 3
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 97 - 60, $y + 66 - 21)
	GUICtrlSetPos($aAddTile1, $x - 97 - 60, $y + 66 - 51)
	GUICtrlSetPos($aAddTile2, $x - 97 - 60, $y + 66 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func f2()
	$SideNumber = 2
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 112 - 60, $y + 77 - 21)
	GUICtrlSetPos($aAddTile1, $x - 112 - 60, $y + 77 - 51)
	GUICtrlSetPos($aAddTile2, $x - 112 - 60, $y + 77 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func f1()
	$SideNumber = 1
	$SideType = "_F"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $f1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile0, $x - 127 - 60, $y + 88 - 21)
	GUICtrlSetPos($aAddTile1, $x - 127 - 60, $y + 88 - 51)
	GUICtrlSetPos($aAddTile2, $x - 127 - 60, $y + 88 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc
Func fAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($fAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($fAddTile1, 0x000080)


EndFunc
Func fAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($fAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($fAddTile2, 0x000080)

EndFunc
Func fAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($fAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($fAddTile0, 0x000080)

EndFunc

;$Sf10L1 = HIDED
Func Sf2L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ; MAKE CHOOSEN LAST NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE CHOOSEN LAST NUMBER BACKGROUN BLUE
	$GuiLastSpellPoint = $Sf2L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080) ;MAKE CHOOSEN SPELL NUMBER BROWN
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE CHOOSEN SPELL NUMBER BACKGROUND YELLOW
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ;MAKE LAST CHOOSEN ARMY NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000);MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND RED

EndFunc
Func Sf3L1()
	$SpellSideNumber = 3
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf5L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf6L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf8L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf9L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L1()
	$AddTile = "-4"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L1
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc

;$Sf10L1 = HIDED
Func Sf2L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf3L2()
	$SpellSideNumber = 3
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf5L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf6L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf8L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf9L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L2()
	$AddTile = "-6"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L2
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc


;$Sf10L3 = HIDED

Func Sf2L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf3L3()
	$SpellSideNumber = 3
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf5L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf6L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf8L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 8
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf9L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L3()
	$AddTile = "-8"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L3
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc


;$Sf10L4 = HIDED
Func Sf9L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf8L4()
	$SpellSideNumber = 8
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf2L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L4()
	$AddTile = "-10"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L4
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


EndFunc
;$Sf10L5 = HIDED
Func Sf9L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf8L5()
	$SpellSideNumber = 8
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	$SpellSideNumber = 3

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf2L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L5()
	$AddTile = "-12"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L5
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc


;$Sf10L6 = HIDED
Func Sf9L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf8L6()
	$SpellSideNumber = 8
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf2L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L6()
	$AddTile = "-14"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L6
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

;$Sf10L7 = HIDED
Func Sf9L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf8L7()
	$SpellSideNumber = 8
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc

Func Sf7L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L7()
	$AddTile = "-16"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L7
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


;$Sf10L8 = HIDED
EndFunc
Func Sf9L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L8()
	$SpellSideNumber = 8
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf6L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L8()
	$AddTile = "-18"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L8
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

;$Sf10L9 = HIDED
EndFunc
Func Sf9L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L9()
	$SpellSideNumber = 8
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf6L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L9()
	$AddTile = "-20"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L9
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


;$Sf10L10 = HIDED
EndFunc
Func Sf9L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L10()
	$SpellSideNumber = 8
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf6L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L10()
	$AddTile = "-22"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L10
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)



;$Sf10L11 = HIDED
EndFunc
Func Sf9L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L11()
	$SpellSideNumber = 8
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf6L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L11()
	$AddTile = "-24"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L11
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

;$Sf10L12 = HIDED
EndFunc
Func Sf9L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L12()
	$SpellSideNumber = 8
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf6L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L12()
	$AddTile = "-26"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L12
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

;$Sf10L13 = HIDED
EndFunc
Func Sf9L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L13()
	$SpellSideNumber = 8
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf2L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L13()
	$AddTile = "-28"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L13
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


;$Sf10L14 = HIDED
EndFunc
Func Sf9L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L14()
	$SpellSideNumber = 8
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L14()
	$AddTile = "-30"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L14
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)



EndFunc
;$Sf10L15 = HIDED
Func Sf9L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf8L15()
	$SpellSideNumber = 8
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf2L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L15()
	$AddTile = "-32"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L15
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)


EndFunc

;$Sf10L16 = HIDED
Func Sf9L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf8L16()
	$SpellSideNumber = 8
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf7L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf6L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf5L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf4L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf2L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L16()
	$AddTile = "-34"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L16
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

;$Sf10L17 = HIDED
EndFunc
Func Sf9L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 9
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf9L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf8L17()
	$SpellSideNumber = 8
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf8L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf7L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 7
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf7L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf6L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 6
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf6L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf5L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 5
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf5L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)

EndFunc
Func Sf4L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 4
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf4L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf3L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 3
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf3L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc

Func Sf2L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 2
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf2L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func Sf1L17()
	$AddTile = "-36"
	$SpellSideType = "_SF"
	$SpellSideNumber = 1
	$AddTileChoose = True
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
	$GuiLastSpellPoint = $Sf1L17
	GUICtrlSetColor($GuiLastSpellPoint, 0x800080)
	GUICtrlSetBkColor($GuiLastSpellPoint, 0xFFFF00)
	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
EndFunc
Func g10()
	$SideNumber = 10
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func g9()
	$SideNumber = 9
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func g8()
	$SideNumber = 8
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func g7()
	$SideNumber = 7
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 741
	Local $y = 255
	GUICtrlSetPos($aAddTile2, $x - 56 - 65, $y + 36 - 21)
	GUICtrlSetPos($aAddTile1, $x - 56 - 65, $y + 36 - 51)
	GUICtrlSetPos($aAddTile0, $x - 56 - 65, $y + 36 - 81)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func g6()
	$SideNumber = 6
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 608
	Local $y = 152
	GUICtrlSetPos($aAddTile0, $x + 72 - 60, $y + 50 + 10)
	GUICtrlSetPos($aAddTile1, $x + 72 - 60, $y + 50 + 40)
	GUICtrlSetPos($aAddTile2, $x + 72 - 60, $y + 50 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func g5()
	$SideNumber = 5
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 608
	Local $y = 152
	GUICtrlSetPos($aAddTile0, $x + 56 - 60, $y + 41 + 10)
	GUICtrlSetPos($aAddTile1, $x + 56 - 60, $y + 41 + 40)
	GUICtrlSetPos($aAddTile2, $x + 56 - 60, $y + 41 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc



Func g4()
	$SideNumber = 4
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 608
	Local $y = 152
	GUICtrlSetPos($aAddTile0, $x + 43 - 60, $y + 32 + 10)
	GUICtrlSetPos($aAddTile1, $x + 43 - 60, $y + 32 + 40)
	GUICtrlSetPos($aAddTile2, $x + 43 - 60, $y + 32 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func g3()
	$SideNumber = 3
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 608
	Local $y = 152
	GUICtrlSetPos($aAddTile0, $x + 29 - 60, $y + 21 + 10)
	GUICtrlSetPos($aAddTile1, $x + 29 - 60, $y + 21 + 40)
	GUICtrlSetPos($aAddTile2, $x + 29 - 60, $y + 21 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func g2()
	$SideNumber = 2
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 608
	Local $y = 152
	GUICtrlSetPos($aAddTile0, $x + 14 - 60, $y + 10 + 10)
	GUICtrlSetPos($aAddTile1, $x + 14 - 60, $y + 10 + 40)
	GUICtrlSetPos($aAddTile2, $x + 14 - 60, $y + 10 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func g1()
	$SideNumber = 1
	$SideType = "_G"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $g1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 608
	Local $y = 152
	GUICtrlSetPos($aAddTile0, $x - 60, $y + 10)
	GUICtrlSetPos($aAddTile1, $x - 60, $y + 40)
	GUICtrlSetPos($aAddTile2, $x - 60, $y + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)


EndFunc



Func gAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($gAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($gAddTile1, 0x000080)

EndFunc

Func gAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($gAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($gAddTile2, 0x000080)
EndFunc

Func gAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($gAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($gAddTile0, 0x000080)
EndFunc



Func h1()
	$SideNumber = 1
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h1
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile2, $x + 123 - 60, $y + 185 - 30)
	GUICtrlSetPos($aAddTile1, $x + 123 - 60, $y + 185 - 60)
	GUICtrlSetPos($aAddTile0, $x + 123 - 60, $y + 185 - 90)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc

Func h2()
	$SideNumber = 2
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h2
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 111 - 60, $y + 77 + 10)
	GUICtrlSetPos($aAddTile1, $x + 111 - 60, $y + 77 + 40)
	GUICtrlSetPos($aAddTile2, $x + 111 - 60, $y + 77 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc



Func h3()
	$SideNumber = 3
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h3
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 99 - 60, $y + 69 + 10)
	GUICtrlSetPos($aAddTile1, $x + 99 - 60, $y + 69 + 40)
	GUICtrlSetPos($aAddTile2, $x + 99 - 60, $y + 69 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func h4()
	$SideNumber = 4
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h4
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 86 - 60, $y + 59 + 10)
	GUICtrlSetPos($aAddTile1, $x + 86 - 60, $y + 59 + 40)
	GUICtrlSetPos($aAddTile2, $x + 86 - 60, $y + 59 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc




Func h5()
	$SideNumber = 5
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h5
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 72 - 60, $y + 50 + 10)
	GUICtrlSetPos($aAddTile1, $x + 72 - 60, $y + 50 + 40)
	GUICtrlSetPos($aAddTile2, $x + 72 - 60, $y + 50 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc

Func h6()
	$SideNumber = 6
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h6
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 56 - 60, $y + 41 + 10)
	GUICtrlSetPos($aAddTile1, $x + 56 - 60, $y + 41 + 40)
	GUICtrlSetPos($aAddTile2, $x + 56 - 60, $y + 41 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func h7()
	$SideNumber = 7
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h7
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 43 - 60, $y + 32 + 10)
	GUICtrlSetPos($aAddTile1, $x + 43 - 60, $y + 32 + 40)
	GUICtrlSetPos($aAddTile2, $x + 43 - 60, $y + 32 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)

EndFunc


Func h8()
	$SideNumber = 8
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h8
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 469
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x + 29 - 60, $y + 21 + 10)
	GUICtrlSetPos($aAddTile1, $x + 29 - 60, $y + 21 + 40)
	GUICtrlSetPos($aAddTile2, $x + 29 - 60, $y + 21 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)


EndFunc

Func h9()
	$SideNumber = 9
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h9
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 29 + 10, $y + 19 + 10)
	GUICtrlSetPos($aAddTile1, $x - 29 + 10, $y + 19 + 40)
	GUICtrlSetPos($aAddTile2, $x - 29 + 10, $y + 19 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc


Func h10()
	$SideNumber = 10
	$SideType = "_H"
	$AddTileChoose = False
	GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
	GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)

	GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF) ; MAKE LAST CHOOSEN NUMBER WHITE
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000) ;MAKE CHOOSEN NUMBER BACKGROUN RED
	$GuiLastArmyPoint = $h10
	GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00) ;MAKE LAST CHOOSEN SPELL NUMBER YELLOW
	GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080) ;MAKE LAST CHOOSEN SPELL NUMBER BACKGROUND BLUE
	GUICtrlSetColor($GuiLastArmyPoint, 0xFF0000) ;MAKE MAKE LAST CHOOSEN ARMY NUMBER RED
	GUICtrlSetBkColor($GuiLastArmyPoint, 0xFFFFFF);MAKE MAKE LAST CHOOSEN ARMY NUMBER BACKGROUND WHITE
	Local $x = 454
	Local $y = 58
	GUICtrlSetPos($aAddTile0, $x - 29 + 10, $y + 19 + 10)
	GUICtrlSetPos($aAddTile1, $x - 29 + 10, $y + 19 + 40)
	GUICtrlSetPos($aAddTile2, $x - 29 + 10, $y + 19 + 70)
	GUICtrlSetState($aAddTile0,$GUI_SHOW)
	GUICtrlSetState($aAddTile1,$GUI_SHOW)
	GUICtrlSetState($aAddTile2,$GUI_SHOW)
EndFunc






Func hAddTile1()
	$AddTile = 1
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($hAddTile1, 0xC0C0C0)
	GUICtrlSetBkColor($hAddTile1, 0x000080)
EndFunc


Func hAddTile2()
	$AddTile = 2
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($hAddTile2, 0xC0C0C0)
	GUICtrlSetBkColor($hAddTile2, 0x000080)
EndFunc

Func hAddTile0()
	$AddTile = 0
	For $i = $aAddTile1 To $hAddTile0
	GUICtrlSetColor($i, 0xFFFFFF)
	GUICtrlSetBkColor($i, 0xFF0000)
	Next
	GUICtrlSetColor($hAddTile0, 0xC0C0C0)
	GUICtrlSetBkColor($hAddTile0, 0x000080)
EndFunc



Func RadioWall1()
	$LogBuilding = "First Most Outer Wall"
	$PtRadiowall1 = 1
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0
EndFunc
Func RadioWall2()
	$LogBuilding = "Second Most Outer Wall"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 1
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0

EndFunc
Func RadioEagle()
	$LogBuilding = "Eagle Artillery"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 1
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0

EndFunc
Func RadioInferno()
	$LogBuilding = "Inferno Tower"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 1
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0

EndFunc
Func RadioXbow()
	$LogBuilding = "X-Bow"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 1
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0

EndFunc
Func RadioWizzTower()
	$LogBuilding = "Wizzard Tower"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 1
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0

EndFunc
Func RadioAirDefense()
	$LogBuilding = "Air Defense"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 1
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0
EndFunc

Func RadioTH()
	$LogBuilding = "Town Hall"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 1
	$PtRadioMortar= 0
	$PtRadioScatterShot = 0

EndFunc
Func RadioMortar()
	$LogBuilding = "Mortar"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 1
	$PtRadioScatterShot = 0
EndFunc
Func RadioScatterShot()
	$LogBuilding = "ScatorShot"
	$PtRadiowall1 = 0
	$PtRadiowall2 = 0
	$PtRadioEagle= 0
	$PtRadioInferno= 0
	$PtRadioXbow= 0
	$PtRadioWizzTower= 0
	$PtRadioAirDefense= 0
	$PtRadioTH= 0
	$PtRadioMortar= 0
	$PtRadioScatterShot = 1
EndFunc


Func ADDCSV()

	$PtRadioTotal = $PtRadiowall1 + $PtRadiowall2 + $PtRadioEagle + $PtRadioInferno + $PtRadioXbow + $PtRadioWizzTower + $PtRadioAirDefense + $PtRadioTH + $PtRadioMortar + $PtRadioScatterShot
	While 1
		GetSleepSize()
		GetWaitInputSize ()
		if $FirstStartErrors = 1 Then
			GetSleepSize()
			GetWaitInputSize ()
			;if user forgets choosing both drop point and AddTile in first begining
			if $SideType = "" And $TType = "Army" And $AddTileChoose = False And $SideNumber = 0 Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0x990000)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 1 >>>Your Army is " &$LOGName& ", but you have to choose Drop Point and AddTile for attack." & @CRLF)
				MsgBox($MB_OK,"NO DROP POINT AND AddTile SELECTED","Please choose One Point and AddTile for your " &$LOGName& ".")
				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
				$SpellSideNumber = 0
				$SideNumber = 0
				$ErrorADDcsv = 1
				$FirstStartErrors = 1
				ExitLoop
			Else
				$FirstStartErrors = 0
			EndIf

			if $TType = "Army" And $AddTileChoose = False And $SideNumber = 0 Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 2B >>>Please first choose Drop Point then choose AddTile for your " &$LOGName& "." & @CRLF)
				_GUICtrlRichEdit_AppendText($LOG,"info : >>>Each AddTile is equal one square from RedLine"& @CRLF)
				MsgBox($MB_OK,"NO POINT SELECTED","Please first choose Drop Point then choose an AddTile for your " &$LOGName& ".")
				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
				$SpellSideNumber = 0
				$SideNumber = 0
				$ErrorADDcsv = 1
				$FirstStartErrors = 1
				ExitLoop
			Else
				$FirstStartErrors = 0
			EndIf

			;if user chooses drop point but forgets choosing AddTile in first begining.
			if $TType = "Army" And $AddTileChoose = False Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 2 >>>Bot will attack from " &$SideType& " on point " &$SideNumber& " but you didn't choose AddTile for your " &$LOGName& "." & @CRLF)
				_GUICtrlRichEdit_AppendText($LOG,"info : >>>Each AddTile is equal one square from RedLine"& @CRLF)
				MsgBox($MB_OK,"NO AddTile SELECTED","Please choose an AddTile for your " &$LOGName& ".")
				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
				$SpellSideNumber = 0
				$SideNumber = 0
				$ErrorADDcsv = 1
				$FirstStartErrors = 1
				ExitLoop
			Else
				$FirstStartErrors = 0
			EndIf

			;if user chooses AddTile but forgets choosing drop point in first begining.
			if $TType = "Army" And $AddTileChoose = True and $SideNumber = 0 Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 2A >>>Bot will attack with " &$AddTile& " AddTile but no drop point selected for your " &$LOGName& "." & @CRLF)
				MsgBox($MB_OK,"NO DROP POINT SELECTED","Please choose a drop point for your " &$LOGName& ".",4)
				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
				$SpellSideNumber = 0
				$SideNumber = 0
				$ErrorADDcsv = 1
				$FirstStartErrors = 1
				ExitLoop
			Else
				$FirstStartErrors = 0
			EndIf

			;if user chooses spell on building but forget choosing drop point in first begining.
			if $SideType = "" And $TType = "Spell" And $SpellSideNumber = 0 And GUICtrlRead($CheckBuilding) = $GUI_CHECKED And $PtRadioTotal = 0 Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 3 >>>Your Army is " &$LOGName& ", but you forget choosing a building.." & @CRLF)
				MsgBox($MB_OK,"NO DROP BUILDING SELECTED","Please choose one building for your " &$LOGName& ".",4)
				$SpellSideNumber = 0
				$SideNumber = 0
				$ErrorADDcsv = 1
				$FirstStartErrors = 1
				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
				ExitLoop
			Else
				$FirstStartErrors = 0
			EndIf

			;if user chooses spell on map but forget choosing drop point in first begining.
			if $SideType = "" And $TType = "Spell" And $SpellSideNumber = 0 And GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 4 >>>Your Army is " &$LOGName& ", but you forget choosing a Drop point.." & @CRLF)
				MsgBox($MB_OK,"NO DROP POINT SELECTED","Please choose One Drop Point for your " &$LOGName& ".",4)
				$SpellSideNumber = 0
				$SideNumber = 0
				$ErrorADDcsv = 1
				$FirstStartErrors = 1
				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
				ExitLoop
			Else
			$FirstStartErrors = 0
			EndIf

		EndIf


		if $FirstStartErrors = 0 And $ErrorADDcsv = 1 Then
;~ 			;if wait input 1 smaller than wait input 2
;~ 			 if GUICtrlRead($CheckWait) = $GUI_CHECKED And GUICtrlRead($WaitInput1) > GUICtrlRead($WaitInput2) Then
;~ 				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
;~ 				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 5B >>>Your wait input 1 is smaller than wait input 2. They must be same or Input 2 must be bigger." & @CRLF)
;~ 				MsgBox($MB_OK,"INCORRECT WAIT INPUT","Please make your wait input 1 smaller than wait input 2 or make them same.",4)
;~ 				$SpellSideNumber = 0
;~ 				$SideNumber = 0
;~ 				$ErrorADDcsv = 1
;~ 				$FirstStartErrors = 1
;~ 				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
;~ 				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
;~ 				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
;~ 				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
;~ 				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
;~ 				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
;~ 				ExitLoop
;~ 			 Else
;~ 				$FirstStartErrors = 0
;~ 			EndIf
;~
;~ 			;if sleep input 1 smaller than wait input 2
;~ 			if GUICtrlRead($Sleep) = $GUI_CHECKED And GUICtrlRead($SleepInput1) > GUICtrlRead($SleepInput2)  Then
;~ 				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
;~ 				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 5C >>>Your sleep input 1 is smaller than sleep input 2. They must be same or Input 2 must be bigger." & @CRLF)
;~ 				MsgBox($MB_OK,"INCORRECT SLEEP INPUT","Please make your sleep input 1 smaller than sleep input 2 or make them same.",4)
;~ 				$SpellSideNumber = 0
;~ 				$SideNumber = 0
;~ 				$ErrorADDcsv = 1
;~ 				$FirstStartErrors = 1
;~ 				GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
;~ 				GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
;~ 				GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
;~ 				GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
;~ 				GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
;~ 				GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
;~ 				ExitLoop
;~ 			Else
;~ 				$FirstStartErrors = 0
;~ 			EndIf


			;if user forgets choosing AddTile and drop point after begining.
			if $TType = "Army" And $SideNumber = 0 And $AddTileChoose = False Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 5 >>>Your Army is " &$LOGName& ", but you have to choose Drop Point and AddTile for each drop." & @CRLF)
				MsgBox($MB_OK,"NO DROP POINT AND AddTile SELECTED","Please choose One Point and AddTile for your " &$LOGName& ".",4)
				$ErrorADDcsv = 1
				ExitLoop
			Else
				$ErrorADDcsv = 0
			EndIf

			;if user chooses drop point but forgets choosing AddTile in first begining.
			if $TType = "Army" And $AddTileChoose = False And $SideNumber <> 0 Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 6 >>>Bot will attack from " & $SideType & " on point " &$SideNumber& " but you didn't choose AddTile for your " &$LOGName& "." & @CRLF)
				_GUICtrlRichEdit_AppendText($LOG,"info : >>>Each AddTile is equal one square from RedLine"& @CRLF)
				MsgBox($MB_OK,"NO AddTile SELECTED","Please choose an AddTile for your " &$LOGName& ".",4)
				$ErrorADDcsv = 1
				ExitLoop
			Else
				$ErrorADDcsv = 0
			EndIf

			;if user chooses spell but forgets choosing drop point after begining.
			if $TType = "Spell" And $SpellSideNumber = 0 and GUICtrlRead($CheckBuilding) = $GUI_UNCHECKED Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 7 >>>Bot will attack with " &$LOGName& " but you didn't choose drop point for your " &$LOGName& "." & @CRLF)
				MsgBox($MB_OK,"NO DROP POINT SELECTED","Please choose a point for your " &$LOGName& ".",4)
				$ErrorADDcsv = 1
				ExitLoop
			Else
				$ErrorADDcsv = 0
			EndIf

			;if user chooses spell but forgets choosing building.
			if $TType = "Spell" And $SpellSideNumber = 0 and GUICtrlRead($CheckBuilding) = $GUI_CHECKED  and $PtRadioTotal = 0 Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0xC84D0C)
				_GUICtrlRichEdit_AppendText($LOG,"@Error No : 8 >>>Your Army is " &$LOGName& ", but you forget choosing a building.." & @CRLF)
				MsgBox($MB_OK,"NO BUILDING SELECTED","Please choose one building for your " &$LOGName& ".",4)
				$ErrorADDcsv = 1
				ExitLoop
			Else
				$ErrorADDcsv = 0
			EndIf

		EndIf

		;If All is RIGHT!!!!!
		if $FirstStartErrors = 0 And $ErrorADDcsv = 0 Then
			if $TType = "Spell" Then
				If GUICtrlRead($CheckBuilding) = $GUI_CHECKED Then
					$LOGEnter = "1 " & $LOGName & " will drop on " & $LogBuilding
					If GUICtrlRead($Sleep) =  $GUI_CHECKED Then
						$LOGEnter = "1 " & $LOGName & " will drop on " & $LogBuilding & " then bot will sleep between " & GUICtrlRead($SleepInput1) & " and " & GUICtrlRead($SleepInput2) & "ms."
					EndIf
				Else
					$LOGEnter = "1 " & $LOGName & " will drop at Point : " & $SpellSideNumber & " Line : " & (-1*Number($AddTile)-2)/2
					If GUICtrlRead($Sleep) =  $GUI_CHECKED Then
						$LOGEnter = "1 " & $LOGName & " will drop at Point : " & $SpellSideNumber & " Line : " & (-1*Number($AddTile)-2)/2 & " then bot will sleep between " & GUICtrlRead($SleepInput1) & " and " & GUICtrlRead($SleepInput2) & "ms."
					EndIf
				EndIf

				$UNDOLine = 4

			EndIf

			If $TType = "Army" Then
				$LOGEnter = "1 " & $LOGName & " will drop at Point : " & $SideNumber & " from " & $SideType & " side with " & $AddTile & " AddTile. (1 AddTile = 1 Square from red line.)"
				If GUICtrlRead($Sleep) =  $GUI_CHECKED Then
					$LOGEnter = "1 " & $LOGName & " will drop at Point : " & $SideNumber & " from " & $SideType & " side with " & $AddTile & " AddTile and" & " then bot will sleep between " & GUICtrlRead($SleepInput1) & " and " & GUICtrlRead($SleepInput2) & "ms.(1 AddTile = 1 Square from redline.)"
				EndIf
				$UNDOLine = 1
			EndIf
			WaitCommandCSV()

			If GUICtrlRead($CheckWait) = $GUI_CHECKED Then
				if $WaitCommand = "           " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. and will not break time.",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "TH         " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if TH is destroyed.",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "SIEGE      " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if Siege is destroyed.",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "TH+SIEGE   " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if both TH and Siege are destroyed.",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "TH,SIEGE   " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if TH or Siege is destroyed.",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "BK         " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if King is activated.",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "AQ         " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if Queen is activated",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "GW         " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if Warden is activated",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "RC         " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if Royal Champion is activated",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "AQ+BK      " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if both King and Queen are activated",$STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				ElseIf $WaitCommand = "AQ,BK      " Then
					$LOGEnter2 = StringStripWS("Wait Command added to CSV. Bot will wait " & $SetWait & " ms. , but will go on if King or Queen are activated", $STR_STRIPLEADING + $STR_STRIPTRAILING + $STR_STRIPSPACES)
				EndIf
			EndIf


			if $TType = "Spell" Then
				If GUICtrlRead($CheckBuilding) = $GUI_CHECKED Then
					$Comment = "1 " & $LOGName & " will drop on " & $LogBuilding & " then bot will sleep between 50-70 ms."
					If GUICtrlRead($Sleep) =  $GUI_CHECKED Then
						$Comment = "1 " & $LOGName & " will drop on " & $LogBuilding & " then bot will sleep between " & GUICtrlRead($SleepInput1) & " and " & GUICtrlRead($SleepInput2) & "ms."
					EndIf
				Else
					$Comment = "1 " & $LOGName & " will drop at Point : " & $SpellSideNumber & " Line : " & (-1*Number($AddTile)-2)/2 & " then bot will sleep between 50-70 ms."
					If GUICtrlRead($Sleep) =  $GUI_CHECKED Then
						$Comment = "1 " & $LOGName & " will drop at Point : " & $SpellSideNumber & " Line : " & (-1*Number($AddTile)-2)/2 & " then bot will sleep between " & GUICtrlRead($SleepInput1) & " and " & GUICtrlRead($SleepInput2) & "ms."
					EndIf
				EndIf
			EndIf

			If $TType = "Army" Then
				$Comment = "1 " & $LOGName & " will drop at Point : " & $SideNumber & " from " & $SideType & " side with " & $AddTile & " AddTile and then bot will sleep between 100-120 ms."
				If GUICtrlRead($Sleep) =  $GUI_CHECKED Then
					$Comment = "1 " & $LOGName & " will drop at Point : " & $SideNumber & " from " & $SideType & " side with " & $AddTile & " AddTile and then bot will sleep between " & GUICtrlRead($SleepInput1) & " and " & GUICtrlRead($SleepInput2) & "ms."
				EndIf
			EndIf

			DropCommand()
			$FirstAdding = False
			$UndoOK = True
			_GUICtrlRichEdit_SetCharColor ( $LOG ,0x1BAB28)
			_GUICtrlRichEdit_AppendText($LOG,$LOGEnter & @CRLF)
			$PtRadiowall1 = 0
			$PtRadiowall2 = 0
			$PtRadioEagle= 0
			$PtRadioInferno= 0
			$PtRadioXbow= 0
			$PtRadioWizzTower= 0
			$PtRadioAirDefense= 0
			$PtRadioTH= 0
			$PtRadioMortar= 0
			If GUICtrlRead($CheckBuilding) = $GUI_CHECKED Then
				ShowSpellPoint()
			EndIf
			GUICtrlSetState($CheckBuilding,$GUI_UNCHECKED)
			GUICtrlSetState($Radiowall1,$GUI_UNCHECKED)
			GUICtrlSetState($Radiowall2,$GUI_UNCHECKED)
			GUICtrlSetState($RadioEagle,$GUI_UNCHECKED)
			GUICtrlSetState($RadioScatterShot,$GUI_UNCHECKED)
			GUICtrlSetState($RadioInferno,$GUI_UNCHECKED)
			GUICtrlSetState($RadioXbow,$GUI_UNCHECKED)
			GUICtrlSetState($RadioWizzTower,$GUI_UNCHECKED)
			GUICtrlSetState($RadioAirDefense,$GUI_UNCHECKED)
			GUICtrlSetState($RadioMortar,$GUI_UNCHECKED)
			GUICtrlSetState($RadioTH,$GUI_UNCHECKED)
			GUICtrlSetState($Radiowall1,$GUI_DISABLE)
			GUICtrlSetState($Radiowall2,$GUI_DISABLE)
			GUICtrlSetState($RadioEagle,$GUI_DISABLE)
			GUICtrlSetState($RadioScatterShot,$GUI_DISABLE)
			GUICtrlSetState($RadioInferno,$GUI_DISABLE)
			GUICtrlSetState($RadioXbow,$GUI_DISABLE)
			GUICtrlSetState($RadioWizzTower,$GUI_DISABLE)
			GUICtrlSetState($RadioAirDefense,$GUI_DISABLE)
			GUICtrlSetState($RadioMortar,$GUI_DISABLE)
			GUICtrlSetState($RadioTH,$GUI_DISABLE)
			GUICtrlSetState($AddRandomXandY, $GUI_UNCHECKED)
			GUICtrlSetState($txtRandomX, $GUI_DISABLE)
			GUICtrlSetState($txtRandomY, $GUI_DISABLE)

			$AddTileChoose = False

			GUICtrlSetColor($GuiLastSpellPoint, 0xFFFF00)
			GUICtrlSetBkColor($GuiLastSpellPoint, 0x000080)
			GUICtrlSetColor($GuiLastArmyPoint, 0xFFFFFF)
			GUICtrlSetBkColor($GuiLastArmyPoint, 0xFF0000)
			GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
			GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
			$SpellSideNumber = 0
			$SideNumber = 0
			$FirstStartErrors = 0
			$ErrorADDcsv = 1
			CountUsedTroops()
			GUICtrlSetData($TextUsedArmy,$ArmyCountTXT)
			GUICtrlSetState($CheckWait,$GUI_ENABLE)
			If GUICtrlRead($CheckWait) = $GUI_CHECKED Then
				_GUICtrlRichEdit_SetCharColor ( $LOG ,0x1BAB28)
				_GUICtrlRichEdit_AppendText($LOG,$LOGEnter2 & @CRLF)
			EndIf

			;GuiControl After CSVWriting
			GUICtrlSetState($Sleep,$GUI_UNCHECKED)
			GUICtrlSetState($SleepInput1,$GUI_DISABLE)
			GUICtrlSetState($SleepInput2,$GUI_DISABLE)
			GUICtrlSetState($CheckWait, $GUI_UNCHECKED)
			GUICtrlSetState($WaitInput1,$GUI_DISABLE)
			GUICtrlSetState($WaitInput2,$GUI_DISABLE)
			GUICtrlSetState($lblWait,$GUI_DISABLE)
			GUICtrlSetState($lblWait2,$GUI_DISABLE)
			GUICtrlSetState($CMBWaitBreakCommand,$GUI_DISABLE)
			GUICtrlSetData($WaitInput1,0)
			GUICtrlSetData($WaitInput2,0)
			ExitLoop





					;Make All drop point normal color
					;Make SideNumber = 0
					;Make All Building and $Check building UNCHECKED
		EndIf


	WEnd

EndFunc

Func UNDO()

	Local $ReadLastLine
	$ReadLastLine = FileReadLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation))
;~ 	MsgBox($MB_OK,"Line",$ReadLastLine,4)
	if $ReadLastLine & @CRLF = $WaitCommandCSV Then
		$TextToWrite = ""
		_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
	EndIf
	if $UndoOK = True Then
		If $UNDOLine = 1 Then
			$TextToWrite = ""
			_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
			$UndoOK = False
			_GUICtrlRichEdit_AppendText($LOG,"[UNDID AND DROP POINT DELETED] Last " & $LOGName & " will not drop " & @CRLF)
			ElseIf $UndoLine = 4 Then
			$TextToWrite = ""
			_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
			$TextToWrite = ""
			_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
			$TextToWrite = ""
			_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
			$TextToWrite = ""
			_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
			$TextToWrite = ""
			_FileWriteToLine($g_sSaveLocation, _FileCountLines($g_sSaveLocation), $TextToWrite, 1)
			$UndoOK = False
			_GUICtrlRichEdit_AppendText($LOG,"[UNDID AND DROP POINT DELETED] Last " & $LOGName & " will not drop " & @CRLF)
		EndIf

		CountUsedTroopsAfterUndo()
		GUICtrlSetData($TextUsedArmy,$ArmyCountTXT)
		;GuiControl After CSVWriting
		GUICtrlSetState($Sleep,$GUI_UNCHECKED)
		GUICtrlSetState($SleepInput1,$GUI_DISABLE)
		GUICtrlSetState($SleepInput2,$GUI_DISABLE)
		GUICtrlSetState($CheckWait, $GUI_UNCHECKED)
		GUICtrlSetState($WaitInput1,$GUI_DISABLE)
		GUICtrlSetState($WaitInput2,$GUI_DISABLE)
		GUICtrlSetState($lblWait,$GUI_DISABLE)
		GUICtrlSetState($lblWait2,$GUI_DISABLE)
		GUICtrlSetState($CMBWaitBreakCommand,$GUI_DISABLE)
		GUICtrlSetData($WaitInput1,0)
		GUICtrlSetData($WaitInput2,0)
		If GUICtrlRead($CheckBuilding) = $GUI_CHECKED Then
			ShowSpellPoint()
		EndIf
		GUICtrlSetState($CheckBuilding,$GUI_UNCHECKED)
		GUICtrlSetState($Radiowall1,$GUI_UNCHECKED)
		GUICtrlSetState($Radiowall2,$GUI_UNCHECKED)
		GUICtrlSetState($RadioEagle,$GUI_UNCHECKED)
		GUICtrlSetState($RadioInferno,$GUI_UNCHECKED)
		GUICtrlSetState($RadioXbow,$GUI_UNCHECKED)
		GUICtrlSetState($RadioWizzTower,$GUI_UNCHECKED)
		GUICtrlSetState($RadioAirDefense,$GUI_UNCHECKED)
		GUICtrlSetState($RadioMortar,$GUI_UNCHECKED)
		GUICtrlSetState($RadioScatterShot,$GUI_UNCHECKED)
		GUICtrlSetState($RadioTH,$GUI_UNCHECKED)
		GUICtrlSetState($Radiowall1,$GUI_DISABLE)
		GUICtrlSetState($Radiowall2,$GUI_DISABLE)
		GUICtrlSetState($RadioEagle,$GUI_DISABLE)
		GUICtrlSetState($RadioInferno,$GUI_DISABLE)
		GUICtrlSetState($RadioXbow,$GUI_DISABLE)
		GUICtrlSetState($RadioWizzTower,$GUI_DISABLE)
		GUICtrlSetState($RadioAirDefense,$GUI_DISABLE)
		GUICtrlSetState($RadioMortar,$GUI_DISABLE)
		GUICtrlSetState($RadioScatterShot,$GUI_DISABLE)
		GUICtrlSetState($RadioTH,$GUI_DISABLE)
		GUICtrlSetState($AddRandomXandY, $GUI_UNCHECKED)
		GUICtrlSetState($txtRandomX, $GUI_DISABLE)
		GUICtrlSetState($txtRandomY, $GUI_DISABLE)
		$AddTileChoose = False
		GUICtrlSetBkColor($GuiLastAddTilePoint,0xFF0000)
		GUICtrlSetColor($GuiLastAddTilePoint, 0xFFFFFF)
		$PtRadiowall1 = 0
		$PtRadiowall2 = 0
		$PtRadioEagle= 0
		$PtRadioInferno= 0
		$PtRadioXbow= 0
		$PtRadioWizzTower= 0
		$PtRadioAirDefense= 0
		$PtRadioTH= 0
		$PtRadioMortar= 0
		$PtRadioScatterShot= 0
	Else
		MsgBox($MB_OK,"UNDO ERROR","You can only undo one time after you press 'ADD CSV' Button")
	EndIf

EndFunc


Func WM_SETCURSOR($hWnd, $iMsg, $wParam, $lParam)
    #forceref $iMsg, $wParam, $lParam

    Switch $hWnd
        Case $GUI_CSV_in_function

            Local $aCursor = GUIGetCursorInfo($GUI_CSV_in_function)

            If (Not @error) And ($aCursor[4] = $troops_pic) Then
                _WinAPI_SetCursor($g_hCursor)
                Return 0
            EndIf
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SETCURSOR
Func WM_SETCURSORSPELL($hWnd, $iMsg, $wParam, $lParam)
    #forceref $iMsg, $wParam, $lParam

    Switch $hWnd
        Case $GUI_CSV_in_function

            Local $aCursor = GUIGetCursorInfo($GUI_CSV_in_function)

            If (Not @error) And ($aCursor[4] = $troops_pic2) Then
                _WinAPI_SetCursor($g_hCursor)
                Return 0
            EndIf
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SETCURSOR
Func OnAutoItExit()
    _WinAPI_DestroyCursor($g_hCursor)
EndFunc   ;==>OnAutoItExit



Func AttackNowAB()
	Local $tempbRunState = $g_bRunState
	Local $tempSieges = $g_aiCurrentSiegeMachines
	$g_aiCurrentSiegeMachines[$eSiegeWallWrecker] = 1
	$g_aiCurrentSiegeMachines[$eSiegeBattleBlimp] = 1
	$g_aiCurrentSiegeMachines[$eSiegeStoneSlammer] = 1
	$g_aiCurrentSiegeMachines[$eSiegeBarracks] = 1
	$g_aiAttackAlgorithm[$LB] = 1										; Select Scripted Attack
	$g_sAttackScrScriptName[$LB] = GuiCtrlRead($g_hCmbScriptNameAB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$g_iMatchMode = $LB													; Select Live Base As Attack Type
	$g_bRunState = True
	PrepareAttack($g_iMatchMode)										;
		Attack()			; Fire xD
	$g_aiCurrentSiegeMachines = $tempSieges
	$g_bRunState = $tempbRunState
EndFunc   ;==>AttackNowAB

Func AttackNowDB()
	Local $tempbRunState = $g_bRunState
	Local $tempSieges = $g_aiCurrentSiegeMachines
	$g_aiCurrentSiegeMachines[$eSiegeWallWrecker] = 1
	$g_aiCurrentSiegeMachines[$eSiegeBattleBlimp] = 1
	$g_aiCurrentSiegeMachines[$eSiegeStoneSlammer] = 1
	$g_aiAttackAlgorithm[$DB] = 1										; Select Scripted Attack
	$g_sAttackScrScriptName[$DB] = GuiCtrlRead($g_hCmbScriptNameDB)		; Select Scripted Attack File From The Combo Box, Cos it wasn't refreshing until pressing Start button
	$g_iMatchMode = $DB													; Select Live Base As Attack Type
	$g_bRunState = True
	PrepareAttack($g_iMatchMode)										;
		Attack()			; Fire xD
	$g_aiCurrentSiegeMachines = $tempSieges
	$g_bRunState = $tempbRunState
EndFunc   ;==>AttackNowDB