# Nvim

> config base https://github.com/NvChad/NvChad

> work commit: https://github.com/NvChad/NvChad/tree/b913bdacfdcdb05a19326019d14d9b240ac689e1

iTerm2 + Tmux + Nvim

# install

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
cd ~/.config/nvim
git checkout b913bdacfdcdb05a19326019d14d9b240ac689e1
git clone https://github.com/d1y/nvim ~/.config/nvim/lua/custom
```
before use `PackerSync`

install ohmytmux and apply my config

```bash
# work to home
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
# apply my custom config tmux :)
patch < ~/.config/nvim/lua/custom/tmux.patch -p1 ~/.tmux.conf.local
```

> my terminal(iTerm2) support set wallpaper

my current wallpaper: https://wallhaven.cc/w/we52yp

# screenhots

2023/03/19

![image.png](https://s2.loli.net/2023/03/19/UckhPoN1EXJd6Vy.png)

2023/03/07

![image.png](https://s2.loli.net/2023/03/07/lcNrCbS2QIRwYsm.png)

2023/02/27

![image.png](https://s2.loli.net/2023/02/27/bGlPk384wtBLijp.png)
