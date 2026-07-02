{pkgs, ...}: {
  programs.vesktop = {
    enable = true;
    package = pkgs.vesktop;
    vencord = {
      themes = {rose-pine-moon = ./rose-pine-moon.css;};
      settings = {
        enabledThemes = ["rose-pine-moon.css"];
      };
    };
  };
}
