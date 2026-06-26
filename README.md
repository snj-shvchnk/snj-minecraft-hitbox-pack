# Snj Minecraft Hitbox Pack

Client-side tooling for Minecraft Bedrock on Windows:

- `SnjHitboxPack.mcpack` adds a green player hitbox overlay.
- `SnjHitboxPack/` contains the editable resource pack source files.
- `minecraft_clicker.ahk` is an optional AutoHotkey helper that repeatedly sends left-click input while the Back side mouse button is held.

## What The Hitbox Pack Does

The resource pack overrides the Bedrock client-side `minecraft:player` render definition and adds a second render controller that draws a green box around visible players.

The box is sized to the vanilla player collision box from Mojang's Bedrock sample files:

- width: `0.6` blocks
- height: `1.8` blocks

This is intended to match a standing player. It is only a visual overlay. It does not change reach, damage, hit registration, movement, knockback, or any server-side mechanics.

## Limitations

- The overlay currently targets standing players.
- It does not dynamically resize for sneaking, swimming, crawling, gliding, or sleeping.
- Multiplayer servers may force their own resource packs, which can override or conflict with this pack.
- Server hit registration is still decided by the server.

## Install The Resource Pack

Use the packaged file:

```text
SnjHitboxPack.mcpack
```

Double-click it on Windows. Minecraft should open and import the pack.

Then enable it in Minecraft:

```text
Settings -> Global Resources -> My Packs -> Snj Hitbox Pack
```

Restart Minecraft after enabling the pack. In first person you will not see your own box; test it by looking at another player.

## Development Install

For editing and testing the source folder directly, copy the `SnjHitboxPack/` directory to:

```text
%LOCALAPPDATA%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\SnjHitboxPack
```

Then enable the pack in a world or in Global Resources.

## Files

```text
SnjHitboxPack/
  manifest.json
  entity/player.entity.json
  models/entity/snj_player_hitbox.geo.json
  render_controllers/snj_hitbox.render_controllers.json
  textures/entity/snj_hitbox.png
  pack_icon.png

SnjHitboxPack.mcpack
minecraft_clicker.ahk
```

## Optional Click Helper

`minecraft_clicker.ahk` requires AutoHotkey v2:

```text
https://www.autohotkey.com/
```

Run the script, open Minecraft Bedrock, then hold the Back side mouse button. In AutoHotkey this button is `XButton1`; in browsers it usually acts as the Back button. While Minecraft is active and `XButton1` is held, the script sends repeated left-click input with randomized timing.

Current timing:

- click hold duration: `8-16 ms`
- interval between clicks: `40-60 ms`

The normal left mouse button is not intercepted and continues to work directly.

The script includes a watchdog that stops clicking if Minecraft loses focus, closes, or `XButton1` is released.

## Notes For Servers

The resource pack is client-side visual content. The click helper is OS-level input automation. Server rules vary: check the server's policy before using macros or client-side visual overlays in multiplayer.

## Credits

The vanilla player resource definition is based on Mojang's Bedrock Add-On sample files:

```text
https://github.com/Mojang/bedrock-samples
```
