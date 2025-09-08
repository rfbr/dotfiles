# Homebrew package manager installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

# Alacritty terminal installation

```bash
brew install alacritty
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

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

OR

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
# Install NVChad
```bash
brew install ripgrep luarocks coursier rust  &&
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
# Install Bottom
```bash
cargo install bottom
```

# Install nvm and node
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install 22
```

#Install uv
```bash
curl -Ls https://astral.sh/uv/install.sh | sh
```

# Symbolic links

```bash
rm -f ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
rm -rf ~/.config/alacritty
ln -s ~/dotfiles/.config/alacritty ~/.config
rm -rf ~/.config/nvim
ln -s ~/dotfiles/.config/nvim ~/.config
rm -r ~/.config/tmux
ln -s ~/dotfiles/.config/tmux ~/.config
```
