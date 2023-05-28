# Summary
The Emacs config that I use for when I use Emacs.

# PREQUISITE
You must have Emacs (obviously)
After pasting my contents onto your .emacs file or downloading it and having it as your .emacs file. Do the following
--If you want C++ support--
1.Install clangd. You would want to head to their website for guidance on doing so https://clangd.llvm.org/installation
-- Install the following packages in emacs after refreshing-contents inside your .emacs file --
2.M-x package-install<RET>yasnippet<RET>
3.M-x package-install<RET>company<RET>
4.M-x package-install<RET>eglot<RET>

-- If you want golang support--
1.Install golang onto your system. Official Website to help you download and install go: https://go.dev/dl/
-- In the .emacs file run these commands --
2.M-x package-install<RET>go-mode<RET>
3.M-x package-install<RET>lsp-mode<RET>
4.M-x package-install<RET>yasnippet<RET>
5.M-x package-install<RET>company<RET>
6.Download gopls by typing this onto your terminal: go install golang.org/x/tools/gopls@latest
  
-- I recommend having both C++ and golang support since the .emacs file includes those two or else it'll just be a waste of space to include one and not the other --

# This is MOSTLY C++ BASED, IF NOT ENTIRELY!
My preferred programming language is C++. So, obviously, this .emacs is based for C++ use.

# UPDATE: Added GoLang go-mode support
I've been interested in the GO Programming Language. I added support for that in configuration.
