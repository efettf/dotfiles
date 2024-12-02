inputs: {
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    environment.systemPackages = with pkgs.fishPlugins; [
      puffer
      sponge
      pisces
      transient-fish
    ];

    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;
    documentation.man.generateCaches = false; # Fixes a slowdown on rebuild.

    files = {
      ".config/fish/themes/main.theme".text = ''
        fish_color_normal ${lib.strings.removePrefix "#" config.scheme.base05}
        fish_color_command ${lib.strings.removePrefix "#" config.scheme.base0D}
        fish_color_param ${lib.strings.removePrefix "#" config.scheme.base0F}
        fish_color_keyword ${lib.strings.removePrefix "#" config.scheme.base08}
        fish_color_quote ${lib.strings.removePrefix "#" config.scheme.base0B}
        fish_color_redirection ${lib.strings.removePrefix "#" config.scheme.base0E}
        fish_color_end ${lib.strings.removePrefix "#" config.scheme.base09}
        fish_color_comment ${lib.strings.removePrefix "#" config.scheme.base03}
        fish_color_error ${lib.strings.removePrefix "#" config.scheme.base08}
        fish_color_gray ${lib.strings.removePrefix "#" config.scheme.base04}
        fish_color_selection --background=${lib.strings.removePrefix "#" config.scheme.base02}
        fish_color_search_match --background=${lib.strings.removePrefix "#" config.scheme.base02}
        fish_color_option ${lib.strings.removePrefix "#" config.scheme.base0B}
        fish_color_operator ${lib.strings.removePrefix "#" config.scheme.base0E}
        fish_color_escape ${lib.strings.removePrefix "#" config.scheme.base09}
        fish_color_autosuggestion ${lib.strings.removePrefix "#" config.scheme.base04}
        fish_color_cancel ${lib.strings.removePrefix "#" config.scheme.base08}
        fish_color_cwd ${lib.strings.removePrefix "#" config.scheme.base0A}
        fish_color_user ${lib.strings.removePrefix "#" config.scheme.base0C}
        fish_color_host ${lib.strings.removePrefix "#" config.scheme.base0D}
        fish_color_host_remote ${lib.strings.removePrefix "#" config.scheme.base0B}
        fish_color_status ${lib.strings.removePrefix "#" config.scheme.base08}
        fish_pager_color_progress ${lib.strings.removePrefix "#" config.scheme.base03}
        fish_pager_color_prefix ${lib.strings.removePrefix "#" config.scheme.base06}
        fish_pager_color_completion ${lib.strings.removePrefix "#" config.scheme.base03}
        fish_pager_color_description ${lib.strings.removePrefix "#" config.scheme.base03}
      '';
      ".config/fish/config.fish".source = ./config.fish;
    };
  };
}
