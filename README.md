# Summary
The Emacs config that I use for when I use Emacs.

# PREQUISITE
You must have Emacs (obviously)<br>
After pasting my contents onto your .emacs file or downloading it and having it as your .emacs file. Do the following<br>
--If you want C++ support--<br>
1.Install clangd. You would want to head to their website for guidance on doing so https://clangd.llvm.org/installation<br>
-- Install the following packages in emacs after refreshing-contents inside your .emacs file --<br>
2.Using emacs pack-install(M - x RET package-install RET) install yasnippet, company, and eglot<br>
<br>
-- If you want golang support--<br>
1.Install golang onto your system. Official Website to help you download and install go: https://go.dev/dl/<br>
-- Install the following packages in emacs after refreshing-contents inside your .emacs file --<br>
2.Using emacs pack-install(M - x RET package-install RET) install go-mode, lsp-mode, yasnippet, company<br>
3.Download gopls by typing this onto your linux terminal: go install golang.org/x/tools/gopls@latest<br>
  <br>
-- I recommend having both C++ and golang support since the .emacs file includes those two or else it'll just be a waste of space to include one and not the other --<br>

# This is MOSTLY C++ BASED, IF NOT ENTIRELY!
My preferred programming language is C++. So, obviously, this .emacs is based for C++ use.

# UPDATE: Added GoLang go-mode support
I've been interested in the GO Programming Language. I added support for that in configuration.
