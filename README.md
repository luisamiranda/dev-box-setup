# dev-box-setup

## Pre-requisites

- [set up github SSH as follows](./instructions/github-ssh.md)
- clone this repo `git clone git@github.com:luisamiranda/dev-box-setup.git`
- run [main.sh](main.sh)

## Main.sh installs

Run the main.sh script (it does require interaction) in Terminal.

```
cd dev-box-setup
zsh main.sh
```

### Programs

- [homebrew](https://docs.brew.sh/Installation)
- [docker desktop](https://docs.docker.com/desktop/) (GUI + VM engine + CLI)
- [iTerm2](https://iterm2.com/)
- [VS code](https://code.visualstudio.com/docs)
- [oh-my-zsh](https://ohmyz.sh/)
  - requires packages below
  - [bullet-train theme](./configs/bullet-train.zsh-theme)
  - copies and sources [.zshrc](./configs/.zshrc)

### Packages

- [node.js](https://nodejs.org/en)
- [git](https://git-scm.com/about)
- [github cli](https://cli.github.com/)

### Fonts

- [Monoid](https://github.com/larsenwork/monoid)
- [FiraCodeiScript](https://github.com/kencrocken/FiraCodeiScript)

## Manual steps

- VS Code Preferences
  - Install Extensions
    - HVE-Core
    - Black Metal
    - Black Formatter
    - Git Blame
    - Smart TODO highlighter
    - Prettier
    - Editorconfig
    - Markdown lint
  - Copy and paste [Settings.json](./configs/settings.json)
  - Quit and restart VS Code

- Create iTerm profile
  - Open iTerm and follow [iTerm settings](./instructions/iterm-settings.com)
  - Quit and restart iTerm

- Set git profile information in gitconfig

```
git config --global user.name "Luisa Miranda"
git config --global user.email "myemail@gmail.com"
```
