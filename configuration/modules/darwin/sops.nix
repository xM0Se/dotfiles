{
  inputs,
  self,
  ...
}: {
  imports = [inputs.sops-nix.darwinModules.sops];
  sops = {
    defaultSopsFile = "${self}/secrets/secrets.yaml";
    defaultSopsFormat = "yaml";
    age.keyFile = "Users/xm0se/.config/sops/age/keys.txt";
  };
}
