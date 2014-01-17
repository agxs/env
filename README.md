My ZSH and Vim environment(plus legacy Bash stuff).
---

Vim environment based on [spf13-vim](https://github.com/spf13/spf13-vim).

Needs to be cloned into the `~/src/env` directory. Then run `setup.sh`. Vim bundles and Oh-My-ZSH are automatically cloned.

**Warning:** The following files will be overwritten:

* `$HOME/.vimrc`
* `$HOME/.vimrc.bundles`
* `$HOME/.inputrc`
* `$HOME/.zshrc`
* `$HOME/.oh-my-zsh/themes/agxs.zsh-theme`
* `$HOME/.tmux.conf`
* `$HOME/.irssi/solarized-universal.theme`
* `$HOME/.irssi/config`

If you use bash, you need to add:

```bash
source ~/.bashrc_as
```

to the end of your `.bashrc`, but the bash stuff is really out of date so I highly recommend using the ZSH configuration.

The ZSH profile relies on [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh). For the theme to look correct you'll need to edit your console font to have extra symbols. It's basically `agnoster` so just follow the [documentation](https://powerline.readthedocs.org/en/latest/fontpatching.html) for setting that up. You'll probably need stuff from [powerline](https://github.com/Lokaltog/vim-powerline.git) too. OS X users can just use the pre-patched fonts. On Linux I had to patch it myself.
