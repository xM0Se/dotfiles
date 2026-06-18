{config, ...}: {
  assertions = [
    {
      assertion = config.services.openssh.settings.PermitRootLogin == "no";
      message = "Root SSH login must be disabled";
    }
    {
      assertions = config.services.openssh.settings.PasswordAuthentication == false;
      message = "Password Authentication must be disabled";
    }
    {
      assertions = config.services.openssh.openFirewall == true;
      message = "Firewall must be open";
    }
  ];
}
