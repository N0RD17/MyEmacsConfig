# Summary
The Emacs config that I use for when I use Emacs.

# PREQUISITE
You must have Emacs (obviously)<br>

# INSTALLATION
After you paste my init.el contents onto your .emacs or .emacs.d/init.el file or downloading it and having it as your .emacs.d/init.el file. Do the following<br>
```
0. Open the init.el file  or .emacs file in Emacs.

1.  M-x <RET> package-refresh-contents <RET>
1.5 If that does not prompt the install then do M-x <RET> package-install-selected-packages <RET>

-- This package use all-the-icons so once you refresh don't forget to do
2. M-x <RET> all-the-icons-install-fonts <RET>

-- This package also uses nerd-icons so once you refresh don't forget to do
3. M-x <RET> nerd-icons-install-fonts <RET>
```

# Language Server Protocol this Emacs config file supports
C/C++ (ClangD) <br>
Python (LSP-Jedi) <br>
Bash (bash-language-server package), if you have the bash-language-server and LSP detects it, it should take care of it for you <br>
