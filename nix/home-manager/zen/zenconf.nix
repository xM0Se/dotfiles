{ self, pkgs, inputs, packages, config,... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
		enable = true;
                # extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
                        # vimium
                # ];


		profiles."default" = {
			containersForce = true;
			containers = {
				programming = {
					color = "purple";
					icon = "circle";
					id = 1;
				};
				nix = {
					color = "blue";
					icon = "circle";
					id = 2;
				};
				cybersecurity = {
					color = "purple";
					icon = "fingerprint";
					id = 3;
				};
				devops = {
					color = "red";
					icon = "circle";
					id = 4;
				};
				keyboards = {
					color = "blue";
					icon = "circle";
					id = 5;
				};
				shopping = {
					color = "green";
					icon = "dollar";
					id = 6;
				};
				chess = {
					color = "green";
					icon = "circle";
					id = 7;
				};
				random-tabs = {
					color = "orange";
					icon = "circle";
					id = 8;
				};
				YouTube = {
					color = "red";
					icon = "chill";
					id = 9;
				};
				music = {
					color = "red";
					icon = "circle";
					id = 10;
				};
				school = {
					color = "blue";
					icon = "briefcase";
					id = 11;
				};
			};
			spacesForce = true;
			spaces = let
				containers = config.programs.zen-browser.profiles."default".containers;
			in {
				"programming" = {
					id = "c73301ec-b04d-4720-8889-6553765e0ddf";
					icon = "🧑‍💻";
					container = containers."programming".id;
					position = 1000;
				};
				"nix" = {
					id = "cdd10fab-4fc5-494b-9041-325e5759195b";
					icon = "🧑‍💻";
					container = containers."nix".id;
					position = 2000;
				};
				"cybersecurity" = {
					id = "78aabdad-8aae-4fe0-8ff0-2a0c6c4ccc24";
					icon = "🛡️";
					container = containers."cybersecurity".id;
					position = 3000;
				};
				"devops" = {
					id = "996c3c38-3953-4c71-812d-8e1ee34369db";
					icon = "🖥️";
					container = containers."devops".id;
					position = 4000;
				};
				"keyboards" = { 
					id = "a093acd1-9365-4678-8c53-1ceab41a8e15";
					icon = "⌨️";
					container = containers."keyboards".id;
					position = 5000;
				};
				"shopping" = {
					id = "74f27dab-7dcc-43fd-b0dd-9aca9d837ffe";
					icon = "🛒";
					container = containers."shopping".id;
					position = 6000;
				};
				"chess" = {
					id = "52c07226-bed1-4f92-a4da-ad69154341b4";
					icon = "💶";
					container = containers."chess".id;
					position = 7000;
				};
				"random-tabs" = {
					id = "cfdd9177-6ea0-4978-8112-2d47f78f778f";
					icon = "🎲";
					container = containers."random-tabs".id;
					position = 8000;
				};
				"YouTube" = {
					id = "40146f90-5862-40ab-9b1a-e8b64309dde0";
					icon = "▶︎";
					container = containers."YouTube".id;
					position = 9000;
				};
				"music" = {
					id = "569974e0-9c81-45f5-be8e-968367a6cff7";
					icon = "🎧";
					container = containers."music".id;
					position = 10000;
				};
				"school" = {
					id = "51c13df6-1f76-46f6-9834-a6c4b6641674";
					icon = "🏫";
					container = containers."school".id;
					position = 11000;
				};


				
			};
		};
		policies = {
			AutofillAddressEnabled = true;
			AutofillCreditCardEnabled = false;
			DisableAppUpdate = true;
			DisableFeedbackCommands = true;
			DisableFirefoxStudies = true;
			DisablePocket = true;
			DisableTelemetry = true;
			DontCheckDefaultBrowser = true;
			NoDefaultBookmarks = true;
			OfferToSaveLogins = false;
			EnableTrackingProtection = {
				Value = true;
				Locked = true;
				Cryptomining = true;
				Fingerprinting = true;
			};
		};
  };

}
