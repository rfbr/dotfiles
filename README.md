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
## Syntax highlighting
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
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
## Install tmux plugins
```bash
<tmux prefix key> I
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
## Symbolic links
```bash
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
rm -r ~/.config/nvim/lua/custom
ln -s ~/dotfiles/.config/nvim/lua/custom ~/.config/nvim/lua/custom
rm -r ~/.config/tmux
ln -s ~/dotfiles/.config/tmux ~/.config/tmux
```
