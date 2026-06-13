_: {
  deployment = {
    targetHost = "nix-server-deploy";
    targetPort = 22;
    targetUser = "deploy";
    buildOnTarget = true;
  };
  imports = [./config.nix];
}
