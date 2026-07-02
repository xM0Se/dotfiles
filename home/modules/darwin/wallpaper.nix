{
  pkgs,
  lib,
  ...
}: let
  wallpaper = pkgs.fetchurl {
    name = "loupe-mono-dark.heic";
    url = "https://misc-assets.raycast.com/wallpapers/loupe-mono-dark.heic";
    sha256 = "sha256-MwvRU7U4tO6F1duxBrHLOd7F5Gnzv/zyiZkm5EFqkY4=";
  };
in {
  # I can use the command ```set-wallpaper-script``` to change my wallpaper to this one
  home.packages = [
    (pkgs.writeShellScriptBin "set-wallpaper-script" ''
      set -e
      /usr/bin/osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"${wallpaper}\""
    '')
  ];
  # This changes my wallpaper every rebuild
  home.activation = {
    setWallpaper = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Setting macOS wallpaper from Nix store..."
      /usr/bin/osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"${wallpaper}\""
    '';
  };
}
