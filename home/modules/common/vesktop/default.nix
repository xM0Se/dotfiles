_: {
  programs.vesktop = {
    enable = true;
    vencord = {
      themes = {rose-pine-moon = ./rose-pine-moon.css;};
      settings = {
        enabledThemes = ["rose-pine-moon.css"];
      };
    };
  };
}
