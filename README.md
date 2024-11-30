
<p align="center">
My personal highly modular Nixos configuration using suckless software, easily extensible by adding your own repositories in flake inputs. Most of the stuff is done behind the scenes on modules repositories and here you can set up high-level settings exported by modules.
</p>

##

<!-- ### 🖼️ Screenshots -->

> [!WARNING] 
> This isn't a distribution or a preconfigured setup for Nixos and you shouldn't use it like one, this is my personal configuration which I try to make as pretty and functional as I can. Please verify everything before applying it as it was only tested on my hosts and could not work on yours.


### 💨 Features

- **Secrets management by [sops-nix](https://github.com/mic92/sops-nix):** simple to manage secrets with easy interface and atomic rollbacks (even in a public repo).
- **Everything is done via modules:** this makes it easy to both manage and organize all your settings without having huge repositories, while still having all of values shared around.
- **Without [home manager](https://github.com/nix-community/home-manager):** most of the stuff you want to do on Nixos could by done by wrappers or by symlinking files, home manager tries to do everything in nix syntax which is overboard in most cases.
- **Automatic theming:** everything has the same colors and is uniform by default using Base16 framework, the color values are exposed by the [colors module](https://github.com/efettf/colors) (which doesn't use [nix-colors](https://github.com/Misterio77/nix-colors)).
- **Minimal:** most of the user programs are provided by [suckless](https://suckless.org) if possible or similar minimal software that is configurable mainly by patching its source code, making the install lightweight and fast.


### 🚧 Status

This repository is **under construction** and is very prone to breaking, luckily thanks to the nature on Nixos its mainly due to user error, so if you fork this repository and update it only when needed, it will last as long as you wish. Nixpkgs input is pinned at **24.11 beta** and will most likely be like that till the next release.


### 🚀 Modules

This repository heavily uses Nixos modules system provided by flakes to split the configuration to multiple repositories all sharing the same Nixos settings and inputs. Here's a list of all of the required and optional modules (might add more in future):

<details open><summary>🐚 Required</summary>

- [system](https://github.com/efnnix/system)
- [theme](https://github.com/efnnix/theme)
- [files](https://github.com/efnnix/files)

</details>

<details open><summary>🧭 Optional</summary>

- [qutebrowser](https://github.com/efnnix/qutebrowser)
- [secrets](https://github.com/efnnix/secrets)
- [ncmpcpp](https://github.com/efnnix/ncmpcpp)
- [console](https://github.com/efnnix/console)
- [kanata](https://github.com/efnnix/kanata)
- [nsxiv](https://github.com/efnnix/nsxiv)
- [dmenu](https://github.com/efnnix/dmenu)
- [xmenu](https://github.com/efnnix/xmenu)
- [gitu](https://github.com/efnnix/gitu)
- [mako](https://github.com/efnnix/mako)
- [tmux](https://github.com/efnnix/tmux)
- [nvim](https://github.com/efnnix/nvim)
- [fish](https://github.com/efnnix/fish)
- [git](https://github.com/efnnix/git)
- [dwl](https://github.com/efnnix/dwl)
- [bin](https://github.com/efnnix/bin)
- [st](https://github.com/efnnix/st)

</details>


### 🌟 Acknowledgements

- **[Junnunkarim's dotfiles](https://github.com/junnunkarim/dotfiles_home)**: beautiful dotfiles with pixel-art using suckless tools.
- **[Sioodmy's dotfiles](https://github.com/sioodmy/dotfiles)**: advanced flake setups and [homix](https://github.com/sioodmy/homix).
- **[Catppuccin](https://github.com/catppuccin/catppuccin)**: Eye-candy color scheme for coding.


<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/c9d3d7de6ab8cb2609b37c4b79b026a2c7784b6f/assets/footers/gray0_ctp_on_line.svg?sanitize=true" />
