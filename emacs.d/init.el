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
   '(vterm eglot emms company-jedi lsp-jedi lsp-ui lsp-java lsp-mode spacemacs-theme dashboard treemacs-nerd-icons treemacs-magit treemacs-projectile treemacs org-bullets flycheck-projectile counsel-projectile projectile nerd-icons-ivy-rich all-the-icons ivy-rich doom-modeline ivy yasnippet company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Only if its GUI do this
(when window-system
  (tool-bar-mode 0)	;; Disable the tool-bar
  (tooltip-mode 0))	;; Disable the tool-tips

;; hide-show sub-mode
;; Initializes hs-minor-mode when emacs detects any program mode hook
(add-hook 'prog-mode-hook (lambda () (hs-minor-mode 1)))

;; Makes backups emacs file be saved in .emacs.d/emacs_saves
(setq backup-directory-alist '(("." . "~/.emacs.d/.backup_saves")))

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
;; show-trailing-whitespace t                       ; Display trailing whitespaces
 split-height-threshold nil                       ; Disable vertical window splitting
 split-width-threshold nil                        ; Disable horizontal window splitting
;; tab-width 4                                      ; Set width for tabs
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



;; ------------ END OF Better Defaults ------------

;; Loads spacemacs theme
(load-theme 'spacemacs-dark t)

;; ------------ START OF ICONS ------------

(require 'all-the-icons)
(require 'nerd-icons)

;; ------------ END OF ICONS ------------

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
(setq dashboard-banner-logo-title "Hello, good hunter, what is it you desire?")

;; Set the banner
(setq dashboard-startup-banner "~/.emacs.d/images/bloodborne/Bloodborne-HunterDream-2-Scaled.png")

(setq dashboard-footer-messages '("I am a doll, here in this dream to look after you."
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
foretell a pleasant awakening. Be one day, a fond, distant memory."))



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
         (lambda (&rest _) (browse-url "github.com"))))))

;; ------------ END OF DASHBOARD AND ITS CONFIGURATIONS ------------


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Enables yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; c-mode and c++-mode Indentation
(setq c-default-style '((c++-mode . "ellemtel") (c-mode . "ellemtel")))
(setq-default indent-tabs-mode nil)

(require 'eglot)
(with-eval-after-load 'eglot
  (require 'flycheck)
  (require 'flycheck-projectile)
  (require 'flycheck-eglot)
  (global-flycheck-eglot-mode 1))
  

;; ------------ START OF C-C++ MODE THINGS ------------

;; c-mode and c++-mode Indentation
(setq c-default-style '((c++-mode . "ellemtel") (c-mode . "ellemtel")))
(setq-default indent-tabs-mode nil)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  ;; Stops eglot form automatically inserting headers
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) . ("clangd" "--header-insertion=never"))))

;; ------------ END OF C-C++ MODE THINGS ------------

;; ------------ START OF JAVA MODE THINGS ------------

(require 'lsp-mode)
(with-eval-after-load 'lsp-mode
  (add-hook 'java-mode-hook 'lsp)
  (setq lsp-ui-doc-show-with-cursor t))

;; ------------ END OF JAVA MODE THINGS ------------

;; ------------ START OF PYTHON MODE THINGS ------------
(require 'lsp-jedi)
(require 'company-jedi)
(with-eval-after-load 'lsp-mode
  (add-hook 'python-mode-hook 'lsp)
  (setq lsp-ui-doc-show-with-cursor t))
;; ------------ END OF PYTHON MODE THINGS ------------

;; ------------ BEGIN DOOM-MODELINE ------------
;; Enable doom-modeline
(require 'doom-modeline)
(add-hook 'after-init-hook 'doom-modeline-mode)
;;(doom-modeline-mode 1) ;; I prefer initializing after init

;; ------------ END OF DOOM-MODELINE ------------

;; ------------ START OF ORG-STUFF ------------
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ------------ END OF ORG-STUFF ------------

;; ------------ START OF IVY ------------
(require 'ivy)
;; Prevents the recentf warnings and errors
(require 'recentf)
(recentf-mode 1)
(require 'projectile)
(with-eval-after-load 'ivy
  (require 'counsel)
  (require 'counsel-projectile)
  (ivy-mode 1)
  (setq projectile-completion-system 'ivy)
  (counsel-projectile-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (global-set-key "\C-s" 'swiper)
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
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))


;; Ivy-Rich
;; Enables nerd-icons before ivy-rich-mode for better performance
;; Enable other packages like counsel-projectile before enabling
;; nerd-icons-ivy-rich-mode
(require 'nerd-icons-ivy-rich)
(require 'ivy-rich)
(nerd-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

;; ------------ END OF IVY ------------

;; ------------ START OF TREEMACS ------------
;; Treemacs, Treemacs-Projectile, Treemacs-Magit, Treemacs-nerds-icons
(require 'treemacs)
(require 'treemacs-projectile)
(require 'treemacs-magit)
(require 'treemacs-nerd-icons)
;; ------------ END OF TREEMACS ------------

;; ------------ START OF ACE-WINDOW ------------
;; TREEMACS comes with Ace-Window preinstalled as a depedency!
(require 'ace-window)

(global-set-key (kbd "C-x o") 'ace-window)

;; ------------ END OF ACE-WINDOW ------------

;; ------------ START OF EMMS ------------
(require 'emms)
(emms-all)
(setq emms-player-list '(emms-player-mpv
                         emms-player-mplayer)
      emms-info-functions '(emms-info-native))

;; Start EMMS after Emacs init
(add-hook 'after-init-hook #'(lambda ()
                               (emms-add-directory "~/Music/")
                               (emms-start)))

;; ------------ END OF EMMS ------------


;; ------------ START OF VTERM ------------

(require 'vterm)
