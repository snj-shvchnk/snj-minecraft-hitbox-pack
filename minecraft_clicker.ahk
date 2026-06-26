#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 1

SendMode "Event"
SetMouseDelay -1

clickHoldMs := 1
clickPauseMs := 30

$XButton1::
{
    global clickHoldMs, clickPauseMs

    while GetKeyState("XButton1", "P") {
        SendEvent "{LButton down}"
        Sleep clickHoldMs
        SendEvent "{LButton up}"
        Sleep clickPauseMs
    }

    SendEvent "{LButton up}"
}
