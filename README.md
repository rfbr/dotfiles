# Homebrew package manager installation
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Alacritty terminal installation
```bash
brew install alacritty
```
## Install Catppucin theme
```bash
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin
```

# ZSH installation
```bash
brew install zsh
```
# Oh My ZSH installation
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
## Completions
```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

```
## Auto suggestions
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
# JetBrains Mono Nerd font 
Download fonts from https://www.nerdfonts.com/font-downloads and add them using Font Book (File > Add Fonts to Current User)

# Install tmux
```bash
brew install tmux
```
## tmux plugin manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
# Installing neovim
```bash
brew install neovim
```
## Installing NvChad 
```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
### Ripgrep is needed by Telescope
```bash
brew install ripgrep
```