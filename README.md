# vimrc
My vimrc to share between my computers. Looks like there's a practice to name
this kind of project dotfiles... Oh well.

# Good resources
- http://vimawesome.com/
- http://stevelosh.com/blog/2010/09/coming-home-to-vim/

# Powerline fonts
The install.sh under the [powerline fonts](https://github.com/powerline/fonts)
project works.

In Slackware I needed to follow the steps [from here](http://duganchen.ca/writings/slackware/fonts/)

Basically: 
```bash
vi /etc/profile.d/lang.sh
LANG from en_US -> en_US.UTF-8
```

To install fonts:
```bash
cp *.ttf ~/.local/share/fonts
fc-cache -f -v
fc-list # to verify
```

# Other programs that I need
- ESLint
https://github.com/eslint/eslint
- AG
https://github.com/ggreer/the_silver_searcher#installing

# For when I use autocompletion
- http://www.smashingmagazine.com/2013/03/26/goodbye-zen-coding-hello-emmet/
- http://emmet.io/
