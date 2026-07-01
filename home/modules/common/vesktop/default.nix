{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      vesktop = prev.vesktop.override {
        pnpm = final.pnpm_10;
      };
    })
  ];
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
