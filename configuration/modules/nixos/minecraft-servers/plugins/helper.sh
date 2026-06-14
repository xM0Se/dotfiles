#!/usr/bin/env bash
LATEST_VERSION=$(curl -s https://api.purpurmc.org/v2/purpur | jq -r '.versions[-1]')

nix run github:BatteredBunny/nix-minecraft-plugin-upgrade -- \
  --loader purpur \
  --game-version "$LATEST_VERSION" \
  --project teaks-tweaks \
  >./purpur/teaks-tweaks.nix

nix run github:BatteredBunny/nix-minecraft-plugin-upgrade -- \
  --loader paper \
  --game-version "$LATEST_VERSION" \
  --project luckperms \
  >./purpur/luckperms.nix

nix run github:BatteredBunny/nix-minecraft-plugin-upgrade -- \
  --loader paper \
  --game-version "$LATEST_VERSION" \
  --project chunky \
  >./paper/chunky.nix
