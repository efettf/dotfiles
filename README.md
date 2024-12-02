
<p align="center">
My personal highly modular Nixos configuration using suckless software, easily extensible by adding your own repositories in flake inputs. Most of the stuff is done behind the scenes on modules repositories and here you can set up high-level settings exported by modules.
</p>

##

<!-- ### 🖼️ Screenshots -->

> [!WARNING] 
> This isn't a distribution or a preconfigured setup for Nixos. 
> This is my personal configuration which I try to make as 
> pretty and functional as I can for my use case. 
> Please verify everything before applying it as it was 
> only tested on my hosts and could not work on yours.


### 🚀 Features

- **Secrets management by [sops-nix](https://github.com/mic92/sops-nix):** simple to manage secrets with easy interface and atomic rollbacks (even in a public repo).
- **Everything is done via modules:** this makes it easy to both manage and organize all your settings without having huge repositories, while still having all of values shared around.
- **Without [home manager](https://github.com/nix-community/home-manager):** most of the stuff you want to do on Nixos could by done by wrappers or by symlinking files, home manager tries to do everything in nix syntax which is overboard in most cases.
- **Automatic theming:** everything has the same colors and is uniform by default using Base16 framework, the color values are exposed by the [colors module](https://github.com/efettf/colors) (which doesn't use [nix-colors](https://github.com/Misterio77/nix-colors)).
- **Minimal:** most of the user programs are provided by [suckless](https://suckless.org) if possible or similar minimal software that is configurable mainly by patching its source code, making the install lightweight and fast.


### 🚧 Status

This repository is **under construction** and is very prone to breaking, luckily thanks to the nature on Nixos its mainly due to user error, so if you fork this repository and update it only when needed, it will last as long as you wish. Nixpkgs input is pinned at **24.11** and will most likely be like that till the next release.


### 📦 Modules

<details open><summary>🐚 Required</summary>

- [system](modules/system)
- [theme](modules/theme)
- [files](modules/files)

</details>

<details open><summary>⚽ Programs</summary>

- [dmenu](programs/dmenu)
- [dwl](programs/dwl)
- [fish](programs/fish)
- [git](programs/git)
- [gitu](programs/gitu)
- [kanata](programs/kanata)
- [mako](programs/mako)
- [ncmpcpp](programs/ncmpcpp)
- [nsxiv](programs/nsxiv)
- [nvim](programs/nvim)
- [qutebrowser](programs/qutebrowser)
- [ssh](programs/ssh)
- [st](programs/st)
- [tmux](programs/tmux)
- [ueberzugpp](programs/ueberzugpp)

</details>

<details open><summary>🧭 General</summary>

- [bin](general/bin)
- [console](general/console)
- [secrets](general/secrets)

</details>


### 🌟 Acknowledgements

- **[Junnunkarim's dotfiles](https://github.com/junnunkarim/dotfiles_home)**: beautiful dotfiles with pixel-art using suckless tools.
- **[Sioodmy's dotfiles](https://github.com/sioodmy/dotfiles)**: advanced flake setups and [homix](https://github.com/sioodmy/homix).
- **[Catppuccin](https://github.com/catppuccin/catppuccin)**: Eye-candy color scheme for coding.


<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/c9d3d7de6ab8cb2609b37c4b79b026a2c7784b6f/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
