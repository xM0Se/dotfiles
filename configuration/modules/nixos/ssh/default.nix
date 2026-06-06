_: {
  services = {
    openssh = {
      enable = true;
      openFirewall = true;
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
