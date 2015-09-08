# vimrc
My vimrc to share between my computers. Looks like there's a practice to name
this kind of project dotfiles... Oh well.

# Good resources
- http://vimawesome.com/
- http://stevelosh.com/blog/2010/09/coming-home-to-vim/
- http://browsenpm.org/package.json
- https://docs.npmjs.com/files/package.json
- [For when I use emmet][3]
- [ESLint][4]

# Powerline fonts
The install.sh under the [powerline fonts][1]
project works.

In Slackware I needed to follow the steps [from here][2]

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

[1]: https://github.com/powerline/fonts
[2]: http://duganchen.ca/writings/slackware/fonts/
[3]: http://www.smashingmagazine.com/2013/03/26/goodbye-zen-coding-hello-emmet/
[4]: https://github.com/eslint/eslint
