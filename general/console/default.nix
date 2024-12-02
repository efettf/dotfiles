inputs: {
  lib,
  config,
  ...
}: {
  config.console.colors =
    map (x: builtins.substring 1 6 config.scheme."base0${x}")
    ["0" "8" "B" "A" "7" "E" "C" "4" "2" "8" "B" "A" "7" "E" "C" "4"];
}
