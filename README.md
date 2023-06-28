# Summary
The Emacs config that I use for when I use Emacs.

# PREQUISITE
```
You must have Emacs (obviously)
After you paste my .emacs contents onto your .emacs file or downloading it and having it as your .emacs file. Do the following

--If you want C++ support--
1.Install clangd. You would want to head to their website for guidance on doing so https://clangd.llvm.org/installation

-- Install the following packages in emacs after refreshing-contents inside your .emacs file (M-x <RET> package-refresh-contents <RET>)
2.Using emacs pack-install(M-x <RET> package-install <RET>) install yasnippet, company, lsp-mode, and eglot

-- If you want golang support--

1.Install golang onto your system. Official Website to help you download and install go: https://go.dev/dl/
-- Install the following packages in emacs after refreshing-contents inside your .emacs file

2.Using emacs pack-install(M - x RET package-install RET) install go-mode, lsp-mode, yasnippet, company

3.Download gopls by typing this onto your linux terminal: go install golang.org/x/tools/gopls@latest
  
```
-- I recommend having both C++ and golang support since the .emacs file includes those two or else it'll just be a waste of space to include one and not the other --<br>

# This is MOSTLY C++ BASED, IF NOT ENTIRELY!
My preferred programming language is C++. So, obviously, this .emacs is based for C++ use.

# UPDATE: Added GoLang go-mode support
I've been interested in the GO Programming Language. I added support for that in configuration.
