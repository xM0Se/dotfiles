{...}: {
  programs.aerospace.settings.on-window-detected = [
    {
      "if".app-id = "com.apple.Passwords";
      run = "layout floating";
    }
    {
      "if".app-id = "com.apple.SFSymbols";
      run = "layout floating";
    }
    {
      "if".app-id = "com.bitwarden.desktop";
      run = "layout floating";
    }
  ];
}
