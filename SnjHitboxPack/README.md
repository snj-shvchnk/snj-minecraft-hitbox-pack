# Snj Hitbox Pack

Client-side Bedrock resource pack that adds a green box overlay to `minecraft:player`.

## Install for testing

Copy this folder into:

`%LOCALAPPDATA%\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang\development_resource_packs\SnjHitboxPack`

Then enable it in Minecraft:

- Local world: World Settings -> Resource Packs -> My Packs.
- Global/multiplayer test: Settings -> Global Resources -> My Packs.

## Notes

- This is visual-only. It does not change reach, hit registration, damage, or server logic.
- The overlay is attached to the player render definition and is hidden in first-person.
- On multiplayer servers, server-provided resource packs may override or conflict with local/global packs.
- If your Minecraft version rejects `player.entity.json`, update Bedrock or regenerate this pack from current Mojang bedrock-samples.
