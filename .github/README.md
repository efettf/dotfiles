
<div aling="center">

<img src="https://img.shields.io/github/repo-size/efettf/dotfiles?style=for-the-badge&labelColor=1e1e2e&color=b4befe"/>
<img src="https://img.shields.io/github/issues/efettf/dotfiles?style=for-the-badge&labelColor=1e1e2e&color=fab387"/>
<img src="https://img.shields.io/badge/active-active?style=for-the-badge&label=STATUS&labelColor=1e1e2e&color=a6e3a1"/>

</div>

<!-- Useful trick to make a space between elements fast, 
it's not the best way to do it I'm sure. -->
###

<p align="center">
Public repository with my nixos dotfiles, they are not designed to be riced in any way. This repo also houses useful links and utilities that I want to have in one place.
</p>

<!-- Create a line seperating stuff on github. -->
##

### 💨 Installation

```bash
$ git clone https://github.com/efettf/dotfiles.git
$ cd dotfiles
$ nixos-rebuild switch --use-remote-sudo --flake .#nixos
```

<!-- List of high level features you might want to see at quick glance. -->
### 🎉 Features

- **Minimal configuration**: everything is easy to understand and manage, doesn't use any special shorthand and frameworks to keep it simple.
- **Excellent documentation**: most of options are explained right there in the configuration in comments, so you don't have to look everything up.
- **Fully open source**: all programs by default are open source and free of charge, please see [list below](https://github.com/efettf/dotfiles#-programs-included) to view full list of them with links.

<!-- Programs in the dependency list, don't list technical stuff,
you can pull links from "search.nixos.org". -->
### 🎸 Programs included

<details open><summary>🔧 Developer Tools</summary>

- [git](https://git-scm.com/)
- [fzf](https://github.com/junegunn/fzf)
- [eza](https://github.com/eza-community/eza)
- [tmux](https://tmux.github.io/)
- [direnv](https://direnv.net)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [tmuxifier](https://github.com/jimeh/tmuxifier)
- [oh-my-posh](https://ohmyposh.dev)

</details>

<details open><summary>🌴 General</summary>

- [pass](https://www.passwordstore.org/)
- [nixvim](https://github.com/nix-community/nixvim)
- [kanata](https://github.com/jtroo/kanata)
- [tealdeer](https://github.com/dbrgn/tealdeer)
- [undollar](https://github.com/xtyrrell/undollar)
- [alacritty](https://github.com/alacritty/alacritty)
- [hyprland](https://github.com/hyprwm/Hyprland)
- [qutebrowser](https://github.com/qutebrowser/qutebrowser)

</details>

### 💡 Tips

<details><summary>🧪 Flake host expansion</summary>

###

You can use this command if _nixos_ **is** your host name:
```bash
$ nixos-rebuild switch --flake .
```
As _._ expands to _.#hostname.

</details>

<details><summary>🫧 Run rebuild as user</summary>

###

If you want to rebuild system without sudo you can run:
```bash
$ nixos-rebuild switch --use-remote-sudo
```
It will use sudo only if it needs to, so it won't run everything as root.

</details>

<!-- Catppuccin banner at the bottom for the looks, 
make sure to remove it when changing theme as well as the colors in banners above. -->
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/c9d3d7de6ab8cb2609b37c4b79b026a2c7784b6f/assets/footers/gray0_ctp_on_line.svg?sanitize=true"/>
