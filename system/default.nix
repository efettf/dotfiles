{
  settings,
  scheme,
  pkgs,
  lib,
  ...
}: {
  imports = [./hardware.nix];

  services = {
    blueman.enable = true;
    openssh.enable = true;
    libinput.enable = true; # Enable touchpad support.

    kanata = {
      enable = true;
      keyboards.main.config = builtins.readFile ./config.kbd;
    };

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

  console.colors = map (name: lib.strings.removePrefix "#" scheme."${name}") (builtins.attrNames scheme);

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

  fonts.packages = [(pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})];

  networking.hostName = settings.host;

  environment.systemPackages = [pkgs.doas-sudo-shim];

  time.timeZone = "Europe/Warsaw";

  users.users.${settings.user} = {
    isNormalUser = true;
    initialPassword = "nixos";
    extraGroups = ["wheel"];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "24.05";
}
