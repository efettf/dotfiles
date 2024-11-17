{
  services.kanata = {
    enable = true;
    keyboards.main.config = builtins.readFile ./config.lisp;
  };
}
