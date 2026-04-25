{
  lib,
  config,
  ...
}: {
  options = {
    zen-spaces.enable =
      lib.mkEnableOption "spaces";
  };
  config = lib.mkIf config.zen-spaces.enable {
    programs.zen-browser.profiles."default" = {
      spacesForce = true;
      spaces = {
        "programming" = {
          id = "c6de089c-410d-4206-961d-ab11f988d40a";
          container = 1;
          position = 1000;
        };
        "nix" = {
          id = "cdd10fab-4fc5-494b-9041-325e5759195b";
          container = 2;
          position = 2000;
        };
        "cybersecurity" = {
          id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
          container = 3;
          position = 3000;
        };
        "devops" = {
          id = "996c3c38-3953-4c71-812d-8e1ee34369db";
          container = 4;
          position = 4000;
        };
        "keyboards" = {
          id = "a093acd1-9365-4678-8c53-1ceab41a8e15";
          container = 5;
          position = 5000;
        };
        "shopping" = {
          id = "74f27dab-7dcc-43fd-b0dd-9aca9d837ffe";
          container = 6;
          position = 6000;
        };
        "chess" = {
          id = "52c07226-bed1-4f92-a4da-ad69154341b4";
          container = 7;
          position = 7000;
        };
        "random-tabs" = {
          id = "cfdd9177-6ea0-4978-8112-2d47f78f778f";
          container = 8;
          position = 8000;
        };
        "YouTube" = {
          id = "40146f90-5862-40ab-9b1a-e8b64309dde0";
          container = 9;
          position = 9000;
        };
        "music" = {
          id = "569974e0-9c81-45f5-be8e-968367a6cff7";
          container = 10;
          position = 10000;
        };
        "school" = {
          id = "51c13df6-1f76-46f6-9834-a6c4b6641674";
          container = 11;
          position = 11000;
        };
      };
    };
  };
}
