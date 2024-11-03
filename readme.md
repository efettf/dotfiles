
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

> [!NOTE]
> Make sure you check out the config before installing it,
> as it may add changes that you don't want.

### 💨 Installation

> [!TIP]
> Use remote sudo will run rebuild as user and use
> sudo when needed.

```bash
$ git clone https://github.com/efettf/dotfiles.git
$ cd dotfiles
$ nixos-generate-config --show-hardware-config > hosts/nixos.nix
$ nixos-rebuild switch --use-remote-sudo --flake ".#nixos"
```

<!-- List of high level features you might want to see at quick glance. -->
### 🎉 Features

> [!WARNING]
> My dotfiles are constantly evolving and changing so
> everything in here might change, if you are going to use
> them please clone this repo.

- **Modular configuration**: everything is easy to understand and manage, uses toml for basic configuration files so its easy to see what is happening at a quick glance.
- **Excellent documentation**: most of advanced options are explained right there in the configuration in comments, so you don't have to look everything up.
- **Fully open source**: all programs by default are open source and free of charge.

<!-- Catppuccin banner at the bottom for the looks, 
make sure to remove it when changing theme as well as the colors in banners above. -->
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/c9d3d7de6ab8cb2609b37c4b79b026a2c7784b6f/assets/footers/gray0_ctp_on_line.svg?sanitize=true"/>
