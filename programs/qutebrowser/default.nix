inputs: {
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    environment.systemPackages = [pkgs.qutebrowser];

    files.".config/qutebrowser/config.py".text =
      builtins.readFile ./config.py
      + ''
        # completion {{{
        ## Background color of the completion widget category headers.
        c.colors.completion.category.bg = "${config.scheme.base00}"
        ## Bottom border color of the completion widget category headers.
        c.colors.completion.category.border.bottom = "${config.scheme.base01}"
        ## Top border color of the completion widget category headers.
        c.colors.completion.category.border.top = "${config.scheme.base02}"
        ## Foreground color of completion widget category headers.
        c.colors.completion.category.fg = "${config.scheme.base0B}"
        ## Background color of the completion widget for even and odd rows.
        c.colors.completion.even.bg = "${config.scheme.base01}"
        c.colors.completion.odd.bg = c.colors.completion.even.bg
        ## Text color of the completion widget.
        c.colors.completion.fg = "${config.scheme.base04}"

        ## Background color of the selected completion item.
        c.colors.completion.item.selected.bg = "${config.scheme.base04}"
        ## Bottom border color of the selected completion item.
        c.colors.completion.item.selected.border.bottom = "${config.scheme.base04}"
        ## Top border color of the completion widget category headers.
        c.colors.completion.item.selected.border.top = "${config.scheme.base04}"
        ## Foreground color of the selected completion item.
        c.colors.completion.item.selected.fg = "${config.scheme.base05}"
        ## Foreground color of the selected completion item.
        c.colors.completion.item.selected.match.fg = "${config.scheme.base06}"
        ## Foreground color of the matched text in the completion.
        c.colors.completion.match.fg = "${config.scheme.base05}"

        ## Color of the scrollbar in completion view
        c.colors.completion.scrollbar.bg = "${config.scheme.base01}"
        ## Color of the scrollbar handle in completion view.
        c.colors.completion.scrollbar.fg = "${config.scheme.base04}"
        # }}}

        # downloads {{{
        c.colors.downloads.bar.bg = "${config.scheme.base00}"
        c.colors.downloads.error.bg = "${config.scheme.base00}"
        c.colors.downloads.start.bg = "${config.scheme.base00}"
        c.colors.downloads.stop.bg = "${config.scheme.base00}"

        c.colors.downloads.error.fg = "${config.scheme.base08}"
        c.colors.downloads.start.fg = "${config.scheme.base0D}"
        c.colors.downloads.stop.fg = "${config.scheme.base0B}"
        c.colors.downloads.system.fg = "none"
        c.colors.downloads.system.bg = "none"
        # }}}

        # hints {{{
        ## Background color for hints. Note that you can use a `rgba(...)` value
        ## for transparency.
        c.colors.hints.bg = "${config.scheme.base09}"

        ## Font color for hints.
        c.colors.hints.fg = "${config.scheme.base01}"

        ## Hints
        c.hints.border = "1px solid " + "${config.scheme.base01}"

        ## Font color for the matched part of hints.
        c.colors.hints.match.fg = "${config.scheme.base04}"
        # }}}

        # keyhints {{{
        ## Background color of the keyhint widget.
        c.colors.keyhint.bg = "${config.scheme.base01}"

        ## Text color for the keyhint widget.
        c.colors.keyhint.fg = "${config.scheme.base05}"

        ## Highlight color for keys to complete the current keychain.
        c.colors.keyhint.suffix.fg = "${config.scheme.base04}"
        # }}}

        # messages {{{
        ## Background color of an error message.
        c.colors.messages.error.bg = "${config.scheme.base04}"
        ## Background color of an info message.
        c.colors.messages.info.bg = "${config.scheme.base04}"
        ## Background color of a warning message.
        c.colors.messages.warning.bg = "${config.scheme.base04}"

        ## Border color of an error message.
        c.colors.messages.error.border = "${config.scheme.base01}"
        ## Border color of an info message.
        c.colors.messages.info.border = "${config.scheme.base01}"
        ## Border color of a warning message.
        c.colors.messages.warning.border = "${config.scheme.base01}"

        ## Foreground color of an error message.
        c.colors.messages.error.fg = "${config.scheme.base08}"
        ## Foreground color an info message.
        c.colors.messages.info.fg = "${config.scheme.base05}"
        ## Foreground color a warning message.
        c.colors.messages.warning.fg = "${config.scheme.base09}"
        # }}}

        # prompts {{{
        ## Background color for prompts.
        c.colors.prompts.bg = "${config.scheme.base01}"

        # ## Border used around UI elements in prompts.
        c.colors.prompts.border = "1px solid " + "${config.scheme.base04}"

        ## Foreground color for prompts.
        c.colors.prompts.fg = "${config.scheme.base05}"

        ## Background color for the selected item in filename prompts.
        c.colors.prompts.selected.bg = "${config.scheme.base04}"

        ## Background color for the selected item in filename prompts.
        c.colors.prompts.selected.fg = "${config.scheme.base06}"
        # }}}

        # statusbar {{{
        ## Background color of the statusbar.
        c.colors.statusbar.normal.bg = "${config.scheme.base00}"
        ## Background color of the statusbar in insert mode.
        c.colors.statusbar.insert.bg = "${config.scheme.base01}"
        ## Background color of the statusbar in command mode.
        c.colors.statusbar.command.bg = "${config.scheme.base00}"
        ## Background color of the statusbar in caret mode.
        c.colors.statusbar.caret.bg = "${config.scheme.base00}"
        ## Background color of the statusbar in caret mode with a selection.
        c.colors.statusbar.caret.selection.bg = "${config.scheme.base00}"

        ## Background color of the progress bar.
        c.colors.statusbar.progress.bg = "${config.scheme.base00}"
        ## Background color of the statusbar in passthrough mode.
        c.colors.statusbar.passthrough.bg = "${config.scheme.base00}"

        ## Foreground color of the statusbar.
        c.colors.statusbar.normal.fg = "${config.scheme.base05}"
        ## Foreground color of the statusbar in insert mode.
        c.colors.statusbar.insert.fg = "${config.scheme.base06}"
        ## Foreground color of the statusbar in command mode.
        c.colors.statusbar.command.fg = "${config.scheme.base05}"
        ## Foreground color of the statusbar in passthrough mode.
        c.colors.statusbar.passthrough.fg = "${config.scheme.base09}"
        ## Foreground color of the statusbar in caret mode.
        c.colors.statusbar.caret.fg = "${config.scheme.base09}"
        ## Foreground color of the statusbar in caret mode with a selection.
        c.colors.statusbar.caret.selection.fg = "${config.scheme.base09}"

        ## Foreground color of the URL in the statusbar on error.
        c.colors.statusbar.url.error.fg = "${config.scheme.base08}"

        ## Default foreground color of the URL in the statusbar.
        c.colors.statusbar.url.fg = "${config.scheme.base05}"

        ## Foreground color of the URL in the statusbar for hovered links.
        c.colors.statusbar.url.hover.fg = "${config.scheme.base0C}"

        ## Foreground color of the URL in the statusbar on successful load
        c.colors.statusbar.url.success.http.fg = "${config.scheme.base0C}"

        ## Foreground color of the URL in the statusbar on successful load
        c.colors.statusbar.url.success.https.fg = "${config.scheme.base0B}"

        ## Foreground color of the URL in the statusbar when there's a warning.
        c.colors.statusbar.url.warn.fg = "${config.scheme.base0A}"

        ## PRIVATE MODE COLORS
        ## Background color of the statusbar in private browsing mode.
        c.colors.statusbar.private.bg = "${config.scheme.base01}"
        ## Foreground color of the statusbar in private browsing mode.
        c.colors.statusbar.private.fg = "${config.scheme.base04}"
        ## Background color of the statusbar in private browsing + command mode.
        c.colors.statusbar.command.private.bg = "${config.scheme.base00}"
        ## Foreground color of the statusbar in private browsing + command mode.
        c.colors.statusbar.command.private.fg = "${config.scheme.base04}"

        # }}}

        # tabs {{{
        ## Background color of the tab bar.
        c.colors.tabs.bar.bg = "${config.scheme.base02}"
        ## Background color of unselected even tabs.
        c.colors.tabs.even.bg = "${config.scheme.base01}"
        ## Background color of unselected odd tabs.
        c.colors.tabs.odd.bg = "${config.scheme.base01}"

        ## Foreground color of unselected even tabs.
        c.colors.tabs.even.fg = "${config.scheme.base04}"
        ## Foreground color of unselected odd tabs.
        c.colors.tabs.odd.fg = "${config.scheme.base04}"

        ## Color for the tab indicator on errors.
        c.colors.tabs.indicator.error = "${config.scheme.base08}"
        ## Color gradient interpolation system for the tab indicator.
        ## Valid values:
        ##	 - rgb: Interpolate in the RGB color system.
        ##	 - hsv: Interpolate in the HSV color system.
        ##	 - hsl: Interpolate in the HSL color system.
        ##	 - none: Don't show a gradient.
        c.colors.tabs.indicator.system = "none"

        # ## Background color of selected even tabs.
        c.colors.tabs.selected.even.bg = "${config.scheme.base00}"
        # ## Background color of selected odd tabs.
        c.colors.tabs.selected.odd.bg = "${config.scheme.base00}"

        # ## Foreground color of selected even tabs.
        c.colors.tabs.selected.even.fg = "${config.scheme.base05}"
        # ## Foreground color of selected odd tabs.
        c.colors.tabs.selected.odd.fg = "${config.scheme.base05}"
        # }}}

        # context menus {{{
        c.colors.contextmenu.menu.bg = "${config.scheme.base00}"
        c.colors.contextmenu.menu.fg = "${config.scheme.base05}"

        c.colors.contextmenu.disabled.bg = "${config.scheme.base01}"
        c.colors.contextmenu.disabled.fg = "${config.scheme.base04}"

        c.colors.contextmenu.selected.bg = "${config.scheme.base04}"
        c.colors.contextmenu.selected.fg = "${config.scheme.base06}"
        # }}}

        # background color for webpages {{{
        c.colors.webpage.bg = "${config.scheme.base00}"
        # }}}
      '';

    systemd.services."qutebrowser-reload" = {
      wantedBy = ["multi-user.target"];
      serviceConfig = {
        Type = "oneshot";
        User = config.user;
        ExecStart = pkgs.writeShellScript "qutebrowser-reload" ''
          hash="$(echo -n "$USER" | md5sum | cut -d' ' -f1)"
          socket="''${XDG_RUNTIME_DIR:-/run/user/$UID}/qutebrowser/ipc-$hash"
          if [[ -S $socket ]]; then
            command=${
            lib.escapeShellArg (builtins.toJSON {
              args = [":config-source"];
              target_arg = null;
              protocol_version = 1;
            })
          }
            echo "$command" | ${pkgs.socat}/bin/socat -lf /dev/null - UNIX-CONNECT:"$socket"
          fi
          unset hash socket command
        '';
      };
    };
  };
}
