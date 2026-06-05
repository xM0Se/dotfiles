_: {
  services = {
    openssh = {
      enable = true;
      settings = {
        UseDns = false;
        PasswordAuthentication = false;
      };
    };
    fail2ban = {
      enable = true;
    };
  };
}
