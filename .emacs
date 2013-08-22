(setq default-directory "d:/home/hanbyulkim")
(add-to-list 'load-path "~/.emacs.d/")
(set-face-attribute 'default nil :font "���������ڵ�-11") ; font setup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t   ; Don't delink hardlinks
      version-control t     ; use version numbers on backups
      delete-old-versions t ; Automatically delete excess backups
      kept-new-versions 20  ; how many of the newest versions to keep
      kept-old-versions 5   ; and how many of the old
)

; color theme select
;(setq load-path (cons (expand-file-name "~/.emacs.d/color-theme") load-path))
;(load-library "color-theme")
;(require 'color-theme)
;(color-theme-initialize)
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
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("i" "inbox" entry (file+headline "~/org/gtd.org" "Inbox")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
             "* %?\nEntered on %U\n  %i\n  %a")))

(setq org-directory "~/org") ; Set to the location of your Org files on your local system
(setq org-mobile-inbox-for-pull "~/org/gtd.org") ; Set to the name of the file where new notes will be stored
(setq org-mobile-directory "~/Dropbox/��/MobileOrg") ; Set to <your Dropbox root directory>/MobileOrg.

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
