{
  inputs,
  self,
  config,
  ...
}: {
  imports = [inputs.sops-nix.homeManagerModules.sops];
  sops = {
    defaultSopsFile = "${self}/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
  };
}
