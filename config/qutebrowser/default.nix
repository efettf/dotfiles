{scheme, ...}: {
  files.".config/qutebrowser/config.py".text =
    builtins.readFile ./config.py
    + (with scheme; ''

      # completion {{{
      ## Background color of the completion widget category headers.
      c.colors.completion.category.bg = "${base00}"
      ## Bottom border color of the completion widget category headers.
      c.colors.completion.category.border.bottom = "${base01}"
      ## Top border color of the completion widget category headers.
      c.colors.completion.category.border.top = "${base02}"
      ## Foreground color of completion widget category headers.
      c.colors.completion.category.fg = "${base0B}"
      ## Background color of the completion widget for even and odd rows.
      c.colors.completion.even.bg = "${base01}"
      c.colors.completion.odd.bg = c.colors.completion.even.bg
      ## Text color of the completion widget.
      c.colors.completion.fg = "${base04}"

      ## Background color of the selected completion item.
      c.colors.completion.item.selected.bg = "${base04}"
      ## Bottom border color of the selected completion item.
      c.colors.completion.item.selected.border.bottom = "${base04}"
      ## Top border color of the completion widget category headers.
      c.colors.completion.item.selected.border.top = "${base04}"
      ## Foreground color of the selected completion item.
      c.colors.completion.item.selected.fg = "${base05}"
      ## Foreground color of the selected completion item.
      c.colors.completion.item.selected.match.fg = "${base06}"
      ## Foreground color of the matched text in the completion.
      c.colors.completion.match.fg = "${base05}"

      ## Color of the scrollbar in completion view
      c.colors.completion.scrollbar.bg = "${base01}"
      ## Color of the scrollbar handle in completion view.
      c.colors.completion.scrollbar.fg = "${base04}"
      # }}}

      # downloads {{{
      c.colors.downloads.bar.bg = "${base00}"
      c.colors.downloads.error.bg = "${base00}"
      c.colors.downloads.start.bg = "${base00}"
      c.colors.downloads.stop.bg = "${base00}"

      c.colors.downloads.error.fg = "${base08}"
      c.colors.downloads.start.fg = "${base0D}"
      c.colors.downloads.stop.fg = "${base0B}"
      c.colors.downloads.system.fg = "none"
      c.colors.downloads.system.bg = "none"
      # }}}

      # hints {{{
      ## Background color for hints. Note that you can use a `rgba(...)` value
      ## for transparency.
      c.colors.hints.bg = "${base09}"

      ## Font color for hints.
      c.colors.hints.fg = "${base01}"

      ## Hints
      c.hints.border = "1px solid " + "${base01}"

      ## Font color for the matched part of hints.
      c.colors.hints.match.fg = "${base04}"
      # }}}

      # keyhints {{{
      ## Background color of the keyhint widget.
      c.colors.keyhint.bg = "${base01}"

      ## Text color for the keyhint widget.
      c.colors.keyhint.fg = "${base05}"

      ## Highlight color for keys to complete the current keychain.
      c.colors.keyhint.suffix.fg = "${base04}"
      # }}}

      # messages {{{
      ## Background color of an error message.
      c.colors.messages.error.bg = "${base04}"
      ## Background color of an info message.
      c.colors.messages.info.bg = "${base04}"
      ## Background color of a warning message.
      c.colors.messages.warning.bg = "${base04}"

      ## Border color of an error message.
      c.colors.messages.error.border = "${base01}"
      ## Border color of an info message.
      c.colors.messages.info.border = "${base01}"
      ## Border color of a warning message.
      c.colors.messages.warning.border = "${base01}"

      ## Foreground color of an error message.
      c.colors.messages.error.fg = "${base08}"
      ## Foreground color an info message.
      c.colors.messages.info.fg = "${base05}"
      ## Foreground color a warning message.
      c.colors.messages.warning.fg = "${base09}"
      # }}}

      # prompts {{{
      ## Background color for prompts.
      c.colors.prompts.bg = "${base01}"

      # ## Border used around UI elements in prompts.
      c.colors.prompts.border = "1px solid " + "${base04}"

      ## Foreground color for prompts.
      c.colors.prompts.fg = "${base05}"

      ## Background color for the selected item in filename prompts.
      c.colors.prompts.selected.bg = "${base04}"

      ## Background color for the selected item in filename prompts.
      c.colors.prompts.selected.fg = "${base06}"
      # }}}

      # statusbar {{{
      ## Background color of the statusbar.
      c.colors.statusbar.normal.bg = "${base00}"
      ## Background color of the statusbar in insert mode.
      c.colors.statusbar.insert.bg = "${base01}"
      ## Background color of the statusbar in command mode.
      c.colors.statusbar.command.bg = "${base00}"
      ## Background color of the statusbar in caret mode.
      c.colors.statusbar.caret.bg = "${base00}"
      ## Background color of the statusbar in caret mode with a selection.
      c.colors.statusbar.caret.selection.bg = "${base00}"

      ## Background color of the progress bar.
      c.colors.statusbar.progress.bg = "${base00}"
      ## Background color of the statusbar in passthrough mode.
      c.colors.statusbar.passthrough.bg = "${base00}"

      ## Foreground color of the statusbar.
      c.colors.statusbar.normal.fg = "${base05}"
      ## Foreground color of the statusbar in insert mode.
      c.colors.statusbar.insert.fg = "${base06}"
      ## Foreground color of the statusbar in command mode.
      c.colors.statusbar.command.fg = "${base05}"
      ## Foreground color of the statusbar in passthrough mode.
      c.colors.statusbar.passthrough.fg = "${base09}"
      ## Foreground color of the statusbar in caret mode.
      c.colors.statusbar.caret.fg = "${base09}"
      ## Foreground color of the statusbar in caret mode with a selection.
      c.colors.statusbar.caret.selection.fg = "${base09}"

      ## Foreground color of the URL in the statusbar on error.
      c.colors.statusbar.url.error.fg = "${base08}"

      ## Default foreground color of the URL in the statusbar.
      c.colors.statusbar.url.fg = "${base05}"

      ## Foreground color of the URL in the statusbar for hovered links.
      c.colors.statusbar.url.hover.fg = "${base0C}"

      ## Foreground color of the URL in the statusbar on successful load
      c.colors.statusbar.url.success.http.fg = "${base0C}"

      ## Foreground color of the URL in the statusbar on successful load
      c.colors.statusbar.url.success.https.fg = "${base0B}"

      ## Foreground color of the URL in the statusbar when there's a warning.
      c.colors.statusbar.url.warn.fg = "${base0A}"

      ## PRIVATE MODE COLORS
      ## Background color of the statusbar in private browsing mode.
      c.colors.statusbar.private.bg = "${base01}"
      ## Foreground color of the statusbar in private browsing mode.
      c.colors.statusbar.private.fg = "${base04}"
      ## Background color of the statusbar in private browsing + command mode.
      c.colors.statusbar.command.private.bg = "${base00}"
      ## Foreground color of the statusbar in private browsing + command mode.
      c.colors.statusbar.command.private.fg = "${base04}"

      # }}}

      # tabs {{{
      ## Background color of the tab bar.
      c.colors.tabs.bar.bg = "${base02}"
      ## Background color of unselected even tabs.
      c.colors.tabs.even.bg = "${base01}"
      ## Background color of unselected odd tabs.
      c.colors.tabs.odd.bg = "${base01}"

      ## Foreground color of unselected even tabs.
      c.colors.tabs.even.fg = "${base04}"
      ## Foreground color of unselected odd tabs.
      c.colors.tabs.odd.fg = "${base04}"

      ## Color for the tab indicator on errors.
      c.colors.tabs.indicator.error = "${base08}"
      ## Color gradient interpolation system for the tab indicator.
      ## Valid values:
      ##	 - rgb: Interpolate in the RGB color system.
      ##	 - hsv: Interpolate in the HSV color system.
      ##	 - hsl: Interpolate in the HSL color system.
      ##	 - none: Don't show a gradient.
      c.colors.tabs.indicator.system = "none"

      # ## Background color of selected even tabs.
      c.colors.tabs.selected.even.bg = "${base00}"
      # ## Background color of selected odd tabs.
      c.colors.tabs.selected.odd.bg = "${base00}"

      # ## Foreground color of selected even tabs.
      c.colors.tabs.selected.even.fg = "${base05}"
      # ## Foreground color of selected odd tabs.
      c.colors.tabs.selected.odd.fg = "${base05}"
      # }}}

      # context menus {{{
      c.colors.contextmenu.menu.bg = "${base00}"
      c.colors.contextmenu.menu.fg = "${base05}"

      c.colors.contextmenu.disabled.bg = "${base01}"
      c.colors.contextmenu.disabled.fg = "${base04}"

      c.colors.contextmenu.selected.bg = "${base04}"
      c.colors.contextmenu.selected.fg = "${base06}"
      # }}}

      # background color for webpages {{{
      c.colors.webpage.bg = "${base00}"
      # }}}

    '');
}
