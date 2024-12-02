inputs: {
  config = let
    ports = [22];
  in {
    services.openssh = {
      enable = true;
      ports = ports;
      settings.PasswordAuthentication = true;
    };
    networking.firewall.allowedTCPPorts = ports;
  };
}
