inputs: {config, ...}: {
  config.services.kanata = {
    enable = true;
    keyboards.main.config = builtins.readFile ./config.kbd;
  };
}
