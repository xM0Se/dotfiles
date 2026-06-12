_: {
  deployment = {
    targetHost = "deploy-nix-server";
    targetPort = 22;
    targetUser = "deploy";
    buildOnTarget = true;
  };
  imports = [./config.nix];
}
