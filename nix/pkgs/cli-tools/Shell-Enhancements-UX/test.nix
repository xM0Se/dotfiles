{ nixpkgs, lib, config, ... }: {

options =  {
  module1.enable =
};

config = {
  option1 = 5;
  option2 = true;
};

    environment.systemPackages =
    [
    nixpkgs.btop
    ];

}
