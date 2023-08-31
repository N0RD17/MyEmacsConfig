;; Sets Melpa Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


;;Disable splashscreen
(setq inhibit-startup-screen t)


;; Only if its GUI do this
(when window-system
  (tool-bar-mode 0)  ;; Disable the tool-bar
  (tooltip-mode 0)) ;; Disable the tool-tips

;;
;; ido management
;; NOW DISABLED TO PREVENT CONFLICT WITH 'helm'
;;(setq ido-everywhere t)
;;(setq ido-enable-flex-matching t)
;;(ido-mode t)
;;

;; Enable automatic pairing
(electric-pair-mode 1)

;; hide-show sub-mode
;; initializes hs-minor-mode when emacs detects any program mode hook
(add-hook 'prog-mode-hook (lambda () (hs-minor-mode 1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tronesque))
 '(custom-safe-themes
   '("aae95bbe93015b723d94b7081fdb27610d393c2156e2cda2e43a1ea7624c9e6f" default))
 '(package-selected-packages
   '(sr-speedbar function-args helm-gtags no-littering helm-projectile projectile all-the-icons doom-modeline gotham-theme dashboard go-mode yasnippet company eglot)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq lsp-enable-links nil)

;; -- NO LITERRING TO KEEP /.config/emacs as clean as possible --
(require 'no-littering)

;; Only when displaying graphics
(when (display-graphic-p)
  (require 'all-the-icons))

;; ---USED LSP MODE for go-mode since Eglot and gopls has issues---
;; Load LSP Mode in .emacs
(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
;; Prevents lsp to add headers automatically
(setq lsp-clients-clangd-args
      '("--header-insertion=never"))

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

(require 'projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;; Configures project for Go Modules(go mod init)
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)

;; c-mode and c++-mode Indentation
(setq c-default-style '((c++-mode . "ellemtel") (c-mode . "ellemtel")))
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
(setq backup-directory-alist '(("." . "~/.emacs.d/.backup_saves")))

;; Loads the tronesque theme
;;(load-theme 'tronesque)

;; Load the gotham-theme
(load-theme 'gotham t)


;; Enables company-mode and set it always in follower sessions
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)



;; Enables yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; Enables go-mode
(require 'go-mode)

;; Enables eglot
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
;; Stops eglot from automatically inserting headers
(add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--header-insertion=never")))

(add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--inlayhints-designators=never")))


;; ------------ Better Defaults? ------------
(setq-default
 ad-redefinition-action 'accept                   ; Silence warnings for redefinition
 auto-window-vscroll nil                          ; Lighten vertical scroll
 confirm-kill-emacs 'yes-or-no-p                  ; Confirm before exiting Emacs
 cursor-in-non-selected-windows nil               ; Hide the cursor in inactive windows
 delete-by-moving-to-trash t                      ; Delete files to trash
 display-time-default-load-average nil            ; Don't display load average
 display-time-format "%H:%M"                      ; Format the time string
 fill-column 80                                   ; Set width for automatic line breaks
 help-window-select t                             ; Focus new help windows when opened
 indent-tabs-mode nil                             ; Use tabs to indent
 inhibit-startup-screen t                         ; Disable start-up screen
 initial-scratch-message ""                       ; Empty the initial *scratch* buffer
 mouse-yank-at-point t                            ; Yank at point rather than pointer
 ns-use-srgb-colorspace nil                       ; Don't use sRGB colors
 select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
 sentence-end-double-space nil                    ; End a sentence after a dot and a space
 show-help-function nil                           ; Disable help messages
;; show-trailing-whitespace t                       ; Display trailing whitespaces
 split-height-threshold nil                       ; Disable vertical window splitting
 split-width-threshold nil                        ; Disable horizontal window splitting
 tab-width 4                                      ; Set width for tabs
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 window-combination-resize t                      ; Resize windows proportionally
 x-stretch-cursor t                               ; Stretch cursor to the glyph width
 delete-old-versions -1                           ; Delete excess backup versions silently
 version-control t                                ; Use version control
 ring-bell-function 'ignore                       ; Silent bell when you make a mistake
 inhibit-compacting-font-caches t                 ; Faster navigation point (costs more memory)
 recentf-mode t                                   ; Keep recent files
 make-backup-files nil                            ; Stop creating backup files
;; display-line-numbers-type 'relative              ; Use relative line numbers
 vc-follow-symlinks t                             ; When the symlink points to a version-controlled file
 use-default-font-for-symbols nil                 ; Do not use the frame font when rendering emojis
 frame-inhibit-implied-resize nil)                ; Don't ask for confirmation when opening symlinked file
(cd "~/")                                         ; Move to the user directory
(add-hook 'prog-mode-hook 'display-line-numbers-mode t)              ; Enable line numbers | 'global' removed so only happens when in a programming mode
(delete-selection-mode 1)                         ; Replace region when inserting text
(display-time-mode 1)                             ; Enable time in the mode-line
(global-auto-revert-mode 1)                       ; Automatically revert a buffer when it changes on disk
(fringe-mode '(8 . 0))                            ; Enable fringe on the left for git-gutter-fringe+
(electric-pair-mode t)                            ; Enable Matching delimeters
(electric-indent-mode t)                          ; Auto indentation
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(global-subword-mode 1)                           ; Iterate through CamelCase words
(menu-bar-mode 0)                                 ; Disable the menu bar
(mouse-avoidance-mode 'jump)                      ; Avoid collision of mouse with point
(put 'downcase-region 'disabled nil)              ; Enable downcase-region
(put 'upcase-region 'disabled nil)                ; Enable upcase-region
(show-paren-mode 1)                               ; Highlight matching parenthesis
(global-hl-line-mode 1)							  ; Highlight the line you're on
(setq ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)	;; using gdb this way is meh you need to do additional commands to display gdb-many-windows and stuff
;; ------------ END OF Better Defaults? ------------

;; ------------ DASHBOARD AND ITS CONFIGURATIONS ------------
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-set-heading-icons t)
;; Use this package
(setq dashboard-icon-type 'all-the-icons)

(setq dashboard-heading-icons '((recents . "history")
                                (bookmarks . "bookmark")
                                (projects . "rocket")))

;; Set the title
(setq dashboard-banner-logo-title "Welcome to your Emacs Trek")
;; Set the banner
(setq dashboard-startup-banner '3)

;; Add widgets to display
(setq dashboard-items '((recents . 5)
                        (bookmarks . 5)
                        (projects . 5)))

;; To modify widget heading name
(setq dashboard-item-names '(("Recent Files:" . "Recently opened files:")))

;; Show navigator below the banner
(setq dashboard-set-navigator t)

;; Format: "(icon title help action face prefix suffix)"
(setq dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Homepage"
         "Browse homepage"
         (lambda (&rest _) (browse-url "homepage")))
        ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
        ("?" "" "?/h" #'show-help nil "<" ">"))
         ;; line 2
        ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
          "Linkedin"
          ""
          (lambda (&rest _) (browse-url "homepage")))
         ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))


;; ------------ END OF DASHBOARD AND ITS CONFIGURATIONS ------------

;; ------------ BEGIN DOOM-MODELINE  ------------
;; Enable doom-modeline
(require 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)
(require 'nerd-icons)
;;(doom-modeline-mode 1) ;; I prefer initializing after init

;; ------------ BEGIN sr-speedbar STUFF ------------

(setq speedbar-show-unknown-files t)

;; ------------ END OF sr-speedbar STUFF ------------

;; ------------ START OF HELM ------------

(require 'helm)
(require 'function-args)
(fa-config-default)


(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g s") 'helm-gtags-find-symbol)
(define-key helm-gtags-mode-map (kbd "C-c g r") 'helm-gtags-find-rtag)
(define-key helm-gtags-mode-map (kbd "C-c g f") 'helm-gtags-find-files)
(define-key helm-gtags-mode-map (kbd "C-c g c") 'helm-gtags-create-tags)
(define-key helm-gtags-mode-map (kbd "C-c g u") 'helm-gtags-update-tags)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(setq-local imenu-create-index-function #'moo-jump-local)

(helm-mode 1)
;; ------------ END OF HELM ------------

;; GOPATH/bin for gopls
(add-to-list 'exec-path "~/go/bin")
(setq gofmt-command "goimports")
