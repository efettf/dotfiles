inputs: {
  config,
  pkgs,
  lib,
  ...
}: let
  plugins = with pkgs.vimPlugins;
  with inputs;
    [
      # Plugins from flake.
      base16
      autosave
      recorder
      sentiment
      alternatetoggler

      # Dependencies.
      plenary-nvim
      promise-async

      # Plugins from pkgs.
      nvim-ufo
      nvim-cmp
      oil-nvim
      fidget-nvim
      conform-nvim
      comment-nvim
      nvim-surround
      gitsigns-nvim
      nvim-lastplace
      nvim-lspconfig
      nvim-autopairs
      telescope-nvim
      nvim-treesitter
      transparent-nvim
      live-command-nvim
      nvim-colorizer-lua

      # Sources for nvim-cmp.
      cmp-path
      cmp-spell
      cmp-nvim-lsp
      cmp-treesitter
    ]
    ++ (with pkgs.vimPlugins.nvim-treesitter-parsers; [
      go
      lua
      vim
      nix
      just
      rust
      bash
      query
      vimdoc
      hyprlang
      markdown
      markdown_inline
    ]);
in {
  environment.systemPackages = with pkgs; [
    neovim
    ripgrep
    wl-clipboard
    #####
    alejandra
    #####
    nil
    gopls
  ];

  files.".config/nvim/init.lua".text =
    builtins.readFile ./config/init.lua
    + ''
      require("mini.base16").setup(${lib.generators.toLua {} {palette = config.scheme;}})
      vim.api.nvim_create_autocmd({"VimEnter", "BufRead", "BufNewFile" }, {
        pattern  = "*",
        command  = 'hi TelescopeBorder guifg=${config.scheme.base02}'
      })
    '';

  systemd.services."nvim-plug" = {
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      Type = "oneshot";
      User = config.user;
      ExecStart = pkgs.writeShellScript "nvim-plug" ''
        mkdir -p $HOME/.config/nvim/pack/vendor/start
        rm -r $HOME/.config/nvim/pack/vendor/start/*
        for plugin in ${lib.strings.concatStringsSep " " plugins}; do
          ln -sf $plugin $HOME/.config/nvim/pack/vendor/start
        done
      '';
    };
  };
}
