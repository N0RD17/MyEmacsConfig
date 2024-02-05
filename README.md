# Summary
The Emacs config that I use for when I use Emacs.

# PREQUISITE
```
You must have Emacs (obviously)
After you paste my init.el contents onto your .emacs or init.el file or downloading it and having it as your init.el file. Do the following

1. YOU MUST HAVE GNU-GLOBAL! This emacs file works with helm-gtags and therefore requires GNU-GLOBAL

2.Install clangd. You would want to head to their website for guidance on doing so https://clangd.llvm.org/installation

-- refresh-contents inside your init.el file (M-x <RET> package-refresh-contents <RET>)
If that does not prompt the install then do M-x <RET> package-install-selected-packages <RET>
This package use all-the-icons so once you refresh don't forget to do
M-x RET all-the-icons-install-fonts RET
This package also uses nerd-icons so once you refresh don't forget to do
M-x RET package-install RET nerd-icons RET and then M-x RET nerd-icons-install-fonts RET
If no options for nerd-icons appear in package-install then just do the option M-x RET nerd-icons-install-fonts RET
  
```
# This is MOSTLY C/C++ BASED, IF NOT ENTIRELY!
My preferred programming language is C and C++. So, obviously, this init.el is based for C/C++ use.
