(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;Disable splashscreen
(setq inhibit-startup-screen t)

;; If GUI version of Emacs
(when window-system
  (menu-bar-mode 0)	;; Disables menu-bar
  (tool-bar-mode 0))	;; Disabes tool-bar

(when (display-graphic-p)
  (require 'all-the-icons))

;; Ido management
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;; Enables ede (Emacs Development Environment)
(global-ede-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8721f7ee8cd0c2e56d23f757b44c39c249a58c60d33194fe546659dabc69eebd" "5283a0c77cc7640fc28493cfdf8957b11e1c72af846d96f5e5a6a37432264c34" "aae95bbe93015b723d94b7081fdb27610d393c2156e2cda2e43a1ea7624c9e6f" default))
 '(ede-project-directories '("/home/paragon/Desktop/dev_cpp/tmp/myproject"))
 '(package-selected-packages
   '(projectile all-the-icons doom-modeline dracula-theme gotham-theme 0blayout treemacs dashboard go-mode yasnippet company eglot)))
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
;; Uncomment the line below if using C
;; The line below overrides c++-mode style to default
;;(setq c-default-style '((c-mode . "ellemtel")))
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

;; ------------------- BEGINNING OF THEMES --------------------
;; C-x C-e to enable one
;; Tronesque-theme
;;(load-theme 'tronesque)

;; gotham-theme
(load-theme 'gotham)

;; dracula-theme
;;(load-theme 'dracula)

;; ------------------- END OF THEMES --------------------

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

;; ----------------- BETTER DEFAULTS  -----------------
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
 ;;show-trailing-whitespace t                       ; Display trailing whitespaces
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
(global-display-line-numbers-mode t)              ; Enable line numbers globally
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
;; ----------------- END OF BETTER DEFAULTS  -----------------

;; ----------------- Some Emacs General Stuff ----------------

;; Garbage collection on focus-out, Emacs should feel snappier. 
(add-hook 'focus-out-hook #'garbage-collect)

;; Default to UTF-8 enconding
(set-default-coding-systems 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)

;; ----------------- END OF EMACS GENERAL STUFF --------------

;; ----------------- ENABLE DASHBOARD AND ITS CONFIGURATIONS -----------------
(require 'dashboard)
(dashboard-setup-startup-hook)

;; Make heading icons enabled
(setq dashboard-set-heading-icons t)
;; Use this package for icon type
(setq dashboard-icon-type 'all-the-icons)
;; Add widgets to display
(setq dashboard-heading-icons '((recents . "file-text")
                                (bookmarks . "bookmark")
                                (projects . "rocket")))
;; Set the title
(setq dashboard-banner-logo-title "Hope you enjoy this Emacs config.")

;; Set the banner
(setq dashboard-startup-banner '2)
;; Customize which widgets are displayed
(setq dashboard-items '((recents . 5)
                        (bookmarks . 5)
                        (projects . 5)))

;; Modify widget heading name
(setq dashboard-item-names '(("Recent Files:" . "Recently opened files:")))

;; To display the navigator below the banner
(setq dashboard-set-navigator t)

;; Format: "(icon title help action face prefix suffix)"
(setq dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Github"
         "Browse homepage"
         (lambda (&rest _) (browse-url "https://github.com/"))))))
;; ------------ END OF ENABLE DASHBOARD AND ITS CONFIGURATIONS ------------

;; --------------- BEGIN DOOM-MODELINE ---------------
;; Enable doom-modeline
(require 'doom-modeline)
(doom-modeline-mode )1
;; --------------- END DOOM-MODELINE ---------------


;;--------------- BEGINNING OF TREEMACS ---------------
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))
;; --------------- END OF TREEMACS ---------------


;; GOPATH/bin for gopls
(add-to-list 'exec-path "~/go/bin")
(setq gofmt-command "goimports")
