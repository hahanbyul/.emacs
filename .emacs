(setq default-directory "d:/home/hanbyulkim")
(set-face-attribute 'default nil :font "³ª´®°íµñÄÚµù-11") ; font setup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t   ; Don't delink hardlinks
      version-control t     ; use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 20  ; how many of the newest versions to keep
      kept-old-versions 5   ; and how many of the old
)

; color theme select
(setq load-path (cons (expand-file-name "~/.emacs.d/color-theme-6.6.0") load-path))
(load-library "color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-calm-forest)

; slime setup
(setq inferior-lisp-program "d:/home/bin/clisp/full/lisp.exe
      -B d:/home/bin/clisp/full
      -M d:/home/bin/clisp/full/lispinit.mem
      -ansi -q")
(add-to-list 'load-path "d:/home/bin/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

; org mode setup
(add-to-list 'load-path "d:/home/hanbyulkim/.emacs.d/elpa/org-20130812")
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; evil setup
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
