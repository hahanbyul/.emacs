(setq default-directory "d:/home/hanbyulkim")
;(server-start) ; to run emacs only one time
(add-to-list 'load-path "~/.emacs.d/")
(set-face-attribute 'default nil :font "³ª´®°íµñÄÚµù-11") ; font setup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")) ; backup file setup
      backup-by-copying t   ; Don't delink hardlinks
      version-control t     ; use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 20  ; how many of the newest versions to keep
      kept-old-versions 5   ; and how many of the old
)

; color theme select
(setq load-path (cons (expand-file-name "~/.emacs.d/color-theme") load-path))
(require 'color-theme)
(color-theme-initialize)
;(color-theme-calm-forest)
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized") ; solarized
(load-theme 'solarized-dark t)

; slime setup
(setq inferior-lisp-program "d:/home/bin/clisp/full/lisp.exe
      -B d:/home/bin/clisp/full
      -M d:/home/bin/clisp/full/lispinit.mem
      -ansi -q")
(add-to-list 'load-path "d:/home/bin/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

; org mode setup
(add-to-list 'load-path "~/.emacs.d/elpa/org-20130812")
(require 'org)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)

(setq org-log-done t)
(setq org-agenda-files (quote ("~/org")))
;(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("c" "collect" entry (file+headline "~/org/collect.org" "Inbox") "* %?\n  RECORDED: %U\n\n")
        ("t" "research (tremor)" entry (file+headline "~/org/research.org" "Next action (tremor)") "* %?\n  %U\n")
        ("s" "study" entry (file+headline "~/org/study.org" "Next action") "* TODO Study %?\n  %U\n")
        ("r" "read" entry (file+headline "~/org/read.org" "Next action") "* TODO Read %?\n  %U\n")
        ("b" "buy" entry (file+headline "~/org/buy.org" "Next action") "* Buy %?\n  %U\n")
        ;("j" "journal" entry (file+datetree "~/org/journal.org") "* %?\nEntered on %U\n  %i\n  %a")
))
(setq org-tag-alist '(("@DESK" . ?d) ("@INTERNET" . ?i) ("@COMPUTER" . ?c) ("@LAB" . ?l) ("@PHONE" . ?p) ("@HOME" . ?h) ("@OUTSIDE" . ?o)  ))
(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "DEFERRED(f)" "PROJECT(p)" "|" "DONE(d)")))

(setq org-directory "~/org") ; Set to the location of your Org files on your local system
(setq org-archive-location (concat org-directory "/archive/%s_archive::"))
(setq org-mobile-inbox-for-pull "~/collect.org") ; Set to the name of the file where new notes will be stored
(setq org-mobile-directory "~/Dropbox/¾Û/MobileOrg") ; Set to <your Dropbox root directory>/MobileOrg.

; org mode -- refile setup
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 1)
                                 (org-agenda-files :maxlevel . 1))))
(setq org-refile-use-outline-path t) ; Use full outline paths for refile targets - we file directly with IDO
(setq org-outline-path-complete-in-steps nil) ; Targets complete directly with IDO
(setq org-refile-allow-creating-parent-nodes (quote confirm)) ; Allow refile to create parent tasks with confirmation
(setq org-completion-use-ido t) ; Use IDO for both buffer and file completion and ido-everywhere to t
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
(setq ido-default-file-method 'selected-window) ; Use the current window when visiting files and buffers with ido
(setq ido-default-buffer-method 'selected-window)
(setq org-indirect-buffer-display 'current-window) ; Use the current window for indirect buffer display

; evil setup
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; undo-tree
(require 'undo-tree)
(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-r") 'redo)

; matlab-mode
(add-to-list 'load-path "~/.emacs.d/matlab-emacs/")
(require 'matlab-load)
;(matlab-cedet-setup)

(setq matlab-shell-command "D:/home/bin/matlabShell/matlabShell.exe")
(setq matlab-shell-command-switches '("10000" "20000"))
;; the following is for non-session based evaluations
(setq org-babel-matlab-shell-command "D:/home/bin/matlabShell/matlabShell.cmd")

;; Have libeng.dll on your PATH or use the following
(setenv "PATH" (concat "C:/PROGRA~1/MATLAB/R2013a/bin/win64;" (getenv "PATH")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((matlab . t) (octave . t)
   ))

(setq org-babel-default-header-args:matlab
  '((:results . "output") (:session . "*MATLAB*")))

; g-client --not installed
;(add-to-list 'load-path "~/.emacs.d/emacs-epackage--g-client/")
;(load-library "g")
;(setq g-user-email "hahanbyul@gmail.com")

; deft
(add-to-list 'load-path "~/.emacs.d/deft")
(require 'deft)
(setq deft-extension "org"
      deft-directory "~/wiki"
      deft-text-mode 'org-mode
      deft-use-filename-as-title t)
(global-set-key (kbd "<f9>") 'deft)
