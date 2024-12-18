(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multiple-cursors emms treemacs-nerd-icons treemacs-magit magit doom-modeline nerd-icons-ivy-rich ivy-rich counsel-projectile counsel swiper lsp-ivy org-superstar toc-org dap-mode lsp-treemacs lsp-ui company-jedi lsp-jedi lsp-mode dashboard nerd-icons all-the-icons doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Only if its GUI do this
(when (display-graphic-p)
  (tool-bar-mode 0)	;; Disable the tool-bar
  (tooltip-mode 0))	;; Disable the tool-tips

;; hide-show sub-mode
;; Initializes hs-minor-mode when emacs detects any program mode hook
(add-hook 'prog-mode-hook (lambda () (hs-minor-mode 1)))

;; Make backups be saved in .emacs.d/emacs_saves and ensure the directory exists
(let ((backup-dir (expand-file-name "~/.emacs.d/.backup_saves")))
  (unless (file-exists-p backup-dir)
    (make-directory backup-dir t))
  (setq backup-directory-alist `(("." . ,backup-dir))))

;; Don't clutter the backup directory
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)  ; Use version numbers for backups
;; Increase the time allowed between key sequences
(setq echo-keystrokes 0.5)

;; Set the Font I want Emacs to use
(set-frame-font "JetBrainsMono Nerd Font Medium 10" nil t)

;; ------------ Better Defaults ------------
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
 ;; show-trailing-whitespace t                    ; Display trailing whitespaces
 split-height-threshold nil                       ; Disable vertical window splitting
 split-width-threshold nil                        ; Disable horizontal window splitting
 ;; tab-width 4                                   ; Set width for tabs
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 window-combination-resize t                      ; Resize windows proportionally
 x-stretch-cursor t                               ; Stretch cursor to the glyph width
 delete-old-versions -1                           ; Delete excess backup versions silently
 version-control t                                ; Use version control
 ring-bell-function 'ignore                       ; Silent bell when you make a mistake
 inhibit-compacting-font-caches t                 ; Faster navigation point (costs more memory)
 recentf-mode t                                   ; Keep recent files
 make-backup-files nil                            ; Stop creating backup files
 display-line-numbers-type 'relative              ; Use relative line numbers
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
(global-hl-line-mode 1)                           ; Highlight the line you're on
(global-set-key (kbd "<f4>") 'undo)               ; Better undo than (C-x u)

;; ------------ END OF Better Defaults ------------

;; ------------ START OF EMACS THEME ------------
;; Loads spacemacs theme
;;(load-theme 'spacemacs-dark t) ;; I don't like it anymore.
;; If I ever want to use DOOM EMACS themes
;;(require 'doom-themes)
(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-one t)
  )
;;  :init (load-theme 'doom-miramare t)
;;(load-theme 'leuven-dark t)
;;(load-theme 'doom-nord t)
;;(load-theme 'doom-city-lights t)
;;(load-theme 'doom-gruvbox t)

;; Gruvbox whenever needed

;; ------------ END OF EMACS THEME ------------

;; ------------ START OF ICONS ------------

(use-package all-the-icons
  :ensure t
  )

(use-package nerd-icons
  :ensure t
  )

;; ------------ END OF ICONS ------------


;; ------------ DASHBOARD AND ITS CONFIGURATIONS ------------
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t
        dashboard-icon-type 'all-the-icons
        dashboard-heading-icons '((recents . "history")
                                  (bookmarks . "bookmark")
                                  (projects . "rocket"))
        dashboard-banner-logo-title "Hello, good hunter, what is it you desire?"
        dashboard-startup-banner "~/.emacs.d/images/bloodborne/Bloodborne-HunterDream-2-Scaled.png"
        dashboard-footer-messages '("I am a doll, here in this dream to look after you."
                                    "Honorable hunter, pursue the echoes of blood
and I will channel them into your strength."
                                    "You will hunt beasts and I will be here for you,
to embolden your sickly spirit."
                                    "Over time, countless hunters have visited this dream.
The graves here stand in their memory... it all seems, so long ago now."
                                    "Hunters have told me about the Church,
about the Gods and their love. But do Gods love their creations.
I am a doll created by you humans, would you ever think to love me?
Of course, I do love you, isn't that how you've made me?"
                                    "O flora, of the moon, of the dream. O little ones, O fleeting will of the ancients.
Let the hunter be safe, let them find comfort. And let this dream, their captor,
foretell a pleasant awakening. Be one day, a fond, distant memory.")
        ;; Add widgets to display
        dashboard-items '((recents . 5) 
                          (bookmarks . 5)
                          (projects . 5))
        ;; To modify widget heading name
        dashboard-item-names '(("Recent Files:" . "Recently opened files:"))
        ;; Show navigator below the banner
        dashboard-set-navigator t
        ;; Format: "(icon title help action face prefix suffix)"
        dashboard-navigator-buttons
	`(((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
            (lambda (&rest _) (browse-url "github.com")))))))

;; ------------ END OF DASHBOARD AND ITS CONFIGURATIONS ------------


;; ------------ START OF LSP MODE ------------

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l") ;; Optional: Change prefix for lsp-mode keybindings
  :hook (
         (c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp)
         (shell-script-mode)
         )
  :commands lsp)

(use-package company
  :ensure t
  :init
  (global-company-mode)  ;; Enable company-mode globally
  :config
  (setq company-minimum-prefix-length 1  ;; Start completion after 1 character
        company-idle-delay 0.0))        ;; Show completions instantly


(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-sideline-enable t))


(use-package dap-mode
  :ensure t
  :config
  (dap-auto-configure-mode))

(global-set-key [f7] 'lsp-find-declaration)

;; ------------ END OF LSP MODE ------------

;; ------------ START OF C-C++ MODE THINGS ------------

;; c-mode and c++-mode Indentation
;; (setq c-default-style '((c++-mode . "stroustrup") (c-mode . "stroustrup")))
  ;; Auto insert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "My C / C++ header")
  '(nil
    "// " (file-name-nondirectory buffer-file-name) "\n"
    "//\n"
    "// Description:\n"
    "//\n"
    (make-string 70 ?/) "\n\n"
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
    	   (nopath (file-name-nondirectory noext))
    	   (ident (concat (upcase nopath) "_H")))
      (concat "#ifndef " ident "\n"
    	      "#define " ident  " \n\n\n"
    	      "\n\n#endif /* " ident " */\n"))))
(global-set-key [f12] 'auto-insert)

;; Stops LSP from annoyingly reformating to how it wants
(setq lsp-enable-on-type-formatting nil)
(setq lsp-enable-indentation nil)

(setq c-default-style '((c++-mode . "ellemtel") (c-mode . "ellemtel")))
;;(setq-default indent-tabs-mode nil)
;;(setq-default tab-width 4)
(setq c-basic-offset 4) ;; Sets Indentation of C functions to 4 instead of ellemtel's 3
;;(setq indent-line-function 'insert-tab)


;; ------------ END OF C-C++ MODE THINGS ------------

;; ------------ START OF PYTHON MODE THINGS ------------

(use-package lsp-jedi
  :after lsp-mode
  :ensure t
  :init
  (setq lsp-jedi-server-command '("jedi-language-server"))
  :hook (python-mode . (lambda()
                         (require 'lsp-jedi)
                         (lsp))) ; Use lsp-jedi for Python
  )

(use-package company-jedi
  :after (lsp-jedi company)
  :ensure t
  :config
  (add-to-list 'company-backends 'company-jedi)) ; Add company-jedi to company backends

;; ------------ END OF PYTHON MODE THINGS ------------

;; ------------ START OF BASH/SHELLSCRIPT MODE ------------

;; After lsp-mode loads, setup a new lsp connection that activates on shellscript mode
;; This connection requires bash-language-server package.
(with-eval-after-load 'lsp-mode
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection '("bash-language-server" "start"))
                    :activation-fn (lsp-activate-on "shellscript")
                    :priority -1
                    :environment-fn (lambda ()
                                      '(("EXPLAINSHELL_ENDPOINT" . lsp-bash-explainshell-endpoint)
                                        ("HIGHLIGHT_PARSING_ERRORS" . lsp-bash-highlight-parsing-errors)))
                    :server-id 'bash-ls))
  )

;; ------------ END OF BASH/SHELLSCRIPT MODE ------------

;; ------------ BEGIN DOOM-MODELINE ------------
;; Enable doom-modeline
;;(require 'doom-modeline)
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))
;;(add-hook 'after-init-hook 'doom-modeline-mode)
;;(doom-modeline-mode 1) ;; I prefer initializing after init

;; ------------ END OF DOOM-MODELINE ------------


;; ------------ START OF ORG-STUFF ------------

(use-package org
  :ensure t
  :hook (org-mode . org-indent-mode))

(use-package toc-org
  :after org
  :ensure t
  :config
  (add-hook 'org-mode-hook 'toc-org-enable))

(use-package org-superstar
  :after org
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;;(require 'org)
;;(add-hook 'org-mode-hook 'org-indent-mode 1)
;;(require 'toc-org)
;;(add-hook 'org-mode-hook 'toc-org-enable)
;;(require 'org-superstar)
;;(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
;; Outdated so I use org-superstar now
;;(require 'org-bullets)
;;(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ------------ END OF ORG-STUFF ------------

;; ------------ START OF IVY ------------

;; Prevents the recentf warnings and errors
(require 'recentf)
(recentf-mode 1)

(require 'projectile)

(use-package lsp-ivy
  :ensure t
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t)
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  )

(use-package counsel
  :after (lsp-ivy)
  :ensure t
  )

(use-package counsel-projectile
  :after (counsel projectile)
  :ensure t
  :config
  (setq projectile-completion-system 'ivy-lsp)
  (counsel-projectile-mode 1)
  )

;; Ivy-Rich
;; Enables nerd-icons before ivy-rich-mode for better performance
;; Enable other packages like counsel-projectile before enabling
;; nerd-icons-ivy-rich-mode
(use-package nerd-icons-ivy-rich
  :after counsel-projectile
  :ensure t
  :config (nerd-icons-ivy-rich-mode 1)
  )

(use-package ivy-rich
  :ensure t
  :after nerd-icons-ivy-rich
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  )

;; ;; ------------ END OF IVY ------------

;; ------------ START OF LSP-TREEMACS ------------
;; Treemacs, Treemacs-Projectile, Treemacs-Magit, Treemacs-nerds-icons

(use-package lsp-treemacs
  :ensure t
  :config
  (setq treemacs-indent-guide-style 'line)
  (treemacs-indent-guide-mode)
  (treemacs-git-mode 'deferred)

  (treemacs-git-commit-diff-mode)
  :bind ("<f5>" . treemacs-select-window)
  :commands lsp-treemacs-errors-list)

(use-package treemacs-projectile
  :after (lsp-treemacs projectile)
  :ensure t
  )
(use-package treemacs-magit
  :after (lsp-treemacs magit)
  :ensure t
  )
(use-package treemacs-nerd-icons
  :after (lsp-treemacs nerd-icons)
  :ensure t
  )

;;(global-set-key (kbd "<f5>") 'treemacs-select-window)
;; ------------ END OF TREEMACS ------------

;; ------------ START OF ACE-WINDOW ------------
;; TREEMACS comes with Ace-Window preinstalled as a depedency!
(use-package ace-window
  :ensure t
  :bind ("C-x o" . ace-window))

;;(global-set-key (kbd "C-x o") 'ace-window)

;; ------------ END OF ACE-WINDOW ------------

;; ------------ START OF EMMS ------------
(use-package emms
  :ensure t
  :config
  (emms-all)
  (setq emms-player-list '(emms-player-mpv
                           emms-player-mplayer)
        emms-info-functions '(emms-info-native))
  ;; Start EMMS after Emacs init
  :hook (after-init . (lambda ()
                        (emms-add-directory "~/Music/")
                        (emms-play-file "~/Music/Bloodborne_Soundtrack_OST___Moonlit_Melody.mp3"))))
;; ------------ END OF EMMS ------------

;; ------------ START OF MULTIPLE-CURSORS ------------

(use-package multiple-cursors
  :ensure t
  :config (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  )

;; ------------ END OF MULTIPLE-CURSORS ------------
