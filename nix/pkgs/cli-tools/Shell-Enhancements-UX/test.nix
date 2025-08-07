{ nixpkgs, lib, config, ... }: {

options =  {
  module1.enable =
    environment.systemPackages =
    [
    nixpkgs.btop
    ];
};

config = {
  option1 = 5;
  option2 = true;
};

}
