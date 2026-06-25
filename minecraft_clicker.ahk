#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 1

SendMode "Event"
SetMouseDelay -1

minecraftExe := "Minecraft.Windows.exe"
clickerEnabled := false

#HotIf IsMinecraftActive()

$MButton::
{
    global clickerEnabled

    if clickerEnabled
        return

    clickerEnabled := true
    SetTimer Watchdog, 50
    DoClick()
}

$MButton Up::
{
    StopClicker()
}

#HotIf

DoClick()
{
    global clickerEnabled

    if !clickerEnabled
        return

    if !IsMinecraftActive() || !GetKeyState("MButton", "P") {
        StopClicker()
        return
    }

    SendEvent "{LButton down}"
    Sleep Random(8, 16)
    SendEvent "{LButton up}"

    if clickerEnabled
        SetTimer DoClick, -Random(40, 60)
}

Watchdog()
{
    if !IsMinecraftActive() || !GetKeyState("MButton", "P")
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