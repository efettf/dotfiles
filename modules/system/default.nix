inputs: {
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [inputs.nix-index.nixosModules.nix-index];

  options.user = lib.mkOption {type = lib.types.str;};

  config = {
    programs.nix-index-database.comma.enable = true;

    user = "lynx";

    services = {
      blueman.enable = true;
      libinput.enable = true; # Enable touchpad support.

      displayManager.ly = {
        enable = true;
        settings.vi_mode = true;
      };
    };

    systemd.targets = {
      # Disable sleep.
      sleep.enable = false;
      suspend.enable = false;
      hibernate.enable = false;
      hybrid-sleep.enable = false;
    };

    environment.systemPackages = with pkgs; [
      fd
      fzf
      eza
      swww
      just
      acpi
      grim
      slurp
      zoxide
      yt-dlp
      tealdeer
      wlsunset

      doas-sudo-shim

      banana-cursor
    ];

    programs.nano.enable = false;

    hardware = {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };

    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    networking = {
      networkmanager.enable = true;
      firewall.enable = true;
    };

    security = {
      sudo.enable = false;
      doas = {
        enable = true;
        wheelNeedsPassword = false;
      };
    };

    time.timeZone = "Europe/Warsaw";

    users.users.${config.user} = {
      isNormalUser = true;
      initialPassword = "nixos";
      extraGroups = ["wheel"];
    };

    nix.settings.experimental-features = ["nix-command" "flakes"];

    system.stateVersion = "24.05";
  };
}
