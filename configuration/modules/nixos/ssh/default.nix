_: {
  services = {
    openssh = {
      enable = true;
      settings = {
        UseDns = false;
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
    fail2ban = {
      enable = true;
    };
  };
}
