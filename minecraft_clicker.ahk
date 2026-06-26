#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 1

SendMode "Event"
SetMouseDelay -1

minecraftExe := "Minecraft.Windows.exe"
clickerEnabled := false
clickHoldMinMs := 6
clickHoldMaxMs := 10
clickIntervalMinMs := 90
clickIntervalMaxMs := 120

#HotIf IsMinecraftActive()

$XButton1::
{
    global clickerEnabled

    if clickerEnabled
        return

    clickerEnabled := true
    SetTimer Watchdog, 50
    DoClick()
}

$XButton1 Up::
{
    StopClicker()
}

#HotIf

DoClick()
{
    global clickerEnabled, clickHoldMinMs, clickHoldMaxMs, clickIntervalMinMs, clickIntervalMaxMs

    if !clickerEnabled
        return

    if !IsMinecraftActive() || !GetKeyState("XButton1", "P") {
        StopClicker()
        return
    }

    SendEvent "{LButton down}"
    Sleep Random(clickHoldMinMs, clickHoldMaxMs)
    SendEvent "{LButton up}"

    if clickerEnabled
        SetTimer DoClick, -Random(clickIntervalMinMs, clickIntervalMaxMs)
}

Watchdog()
{
    if !IsMinecraftActive() || !GetKeyState("XButton1", "P")
        StopClicker()
}

StopClicker()
{
    global clickerEnabled

    clickerEnabled := false
    SetTimer DoClick, 0
    SetTimer Watchdog, 0

    ; На випадок, якщо гра/вікно закрились між down і up.
    SendEvent "{LButton up}"
}

IsMinecraftActive()
{
    return ProcessExist("Minecraft.Windows.exe")
        && WinActive("ahk_exe Minecraft.Windows.exe")
}
