# Summary
The Emacs config that I use for when I use Emacs.

# PREQUISITE
```
You must have Emacs (obviously)
After you paste my init.el contents onto your .emacs or init.el file or downloading it and having it as your init.el file. Do the following

1.  refresh-contents inside your init.el file (M-x <RET> package-refresh-contents <RET>)
1.5 If that does not prompt the install then do M-x <RET> package-install-selected-packages <RET>
-- This package use all-the-icons so once you refresh don't forget to do
2. M-x <RET> all-the-icons-install-fonts <RET>
-- This package also uses nerd-icons so once you refresh don't forget to do
3. M-x <RET> nerd-icons-install-fonts <RET>
```
# LSP/EGLOT FUNCTIONALITY
My preferred language is C/C++, however, I do like to use Python and I want to learn Java.<br>
This Configuration comes with Java and Python LSP.
# Setup for C/C++ with Clangd and Eglot
```
Clangd: https://clangd.llvm.org/installation
1. Download clang with your distro package manager then refresh-contents inside your init.el file (M-x <RET> package-refresh-contents <RET>).
2. Open a C/C++ file and set it up
```
# Setup for LSP Python
```
Jedi: https://github.com/tkf/emacs-jedi
1. Install Jedi Language Server with pip in your Python Virtual Environment(or whatever python package manager you use for the Python)
2. Activate your Python virtual environment and open up the Python file you want to work on with emacs in the terminal. Set it up however you want it.
```
# Setup for LSP Java
```
Java: https://github.com/emacs-lsp/lsp-java
1. Download the JavaJDK with your distro package manager, I went with OpenJDK17 (at the time of writing).
2. Open the .java with emacs and set it up however you want it. 
```
