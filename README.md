# Nvim

> config base https://github.com/NvChad/NvChad

iTerm2 + Tmux + Nvim

# install

```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
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

# screenhots

2023/03/07

![image.png](https://s2.loli.net/2023/03/07/lcNrCbS2QIRwYsm.png)

2023/02/27

![image.png](https://s2.loli.net/2023/02/27/bGlPk384wtBLijp.png)
