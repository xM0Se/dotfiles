{
  lib,
  config,
  programs,
}: let
  ext = import ./lib.nix {inherit lib config programs;};
in {
  options.zen.extensions.youtubeAddons.enable = lib.mkEnableOption "installs youtubeAddons";

  config = lib.mkIf ext.cfg.youtubeAddons.enable {
    ${ext.extensions} = ext.mkExtensionSettings {
      "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}" = "youtube-addon"; #'Improve YouTube!' 🎧 (for YouTube & Videos)
      "myallychou@gmail.com" = "youtube-recommended-videos"; #Unhook: Remove YouTube Recommended Videos Comments
      "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = "return-youtube-dislikes"; #Return YouTube Dislike
    };
  };
}
