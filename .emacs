;; Sets Melpa Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;;Disable splashscreen
(setq inhibit-startup-screen t)

;; Enable automatic pairing
(electric-pair-mode 1)

;; Option if I want to keep or disable menu bar. 1 keeps it.
(menu-bar-mode 1)

;; Enable Ido-mde
(ido-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tronesque))
 '(package-selected-packages '(go-mode yasnippet company eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ---USED LSP MODE for go-mode since Eglot and gopls has issues---
;; Load LSP Mode in .emacs
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; ------------End of LSP Mode load--------------------------------

;; Configure gopls via LSP MODE
(lsp-register-custom-settings
 '(("gopls.completeUnimported" t t)
   ("gopls.staticcheck" t t)))

;; Configures project for Go Modules(go mod init)
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

;; c-c++ - Indentation
(setq c-default-style '((c++-mode . "ellemtel")))
(setq-default indent-tabs-mode nil)

;; Go-Mode
(defun my-go-mode-hook ()

  (setq tab-width 4)
  (setq standard-indent 2)
  (setq indent-tabs-mode nil))

(add-hook 'go-mode-hook 'my-go-mode-hook)

;; Tells emacs I have installed a themes folder
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Makes backups emacs file be saved in .emacs.d/emacs_saves
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs_saves")))

;; Loads the tronesque theme
(load-theme 'tronesque)

;; Enables company-mode and set it always in follower sessions
(require 'company)
(global-company-mode)

;; Enables yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Enables go-mode
(require 'go-mode)

;; Enables eglot
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; GOPATH/bin for gopls
(add-to-list 'exec-path "~/go/bin")
(setq gofmt-command "goimports")
