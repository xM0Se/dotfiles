{inputs, ...}: {
  imports = [inputs.sops-nix.nixosModules.sops];
  sops = {
    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/xm0se/.config/sops/age/keys.txt";
  };
}
