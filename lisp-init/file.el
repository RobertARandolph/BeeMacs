;; File Nav

(use-package wgrep)

(use-package projectile
  :config (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . 'projectile-command-map)
              ("C-x p" . 'projectile-command-map)))

(use-package counsel-projectile
  :config (counsel-projectile-mode)
  :after counsel)

(use-package ag
  :config (setq ag-reuse-buffers 't))

;; File management

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'dired+)

;; Dired-x is so much nicer!
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            ))

(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            (dired-hide-details-mode 0)
            ))
(diredp-toggle-find-file-reuse-dir 1)

(setq dired-listing-switches "-alGh")

;; Git

(use-package magit
  :config (add-hook 'after-save-hook 'magit-after-save-refresh-status t)
  :bind ("s-g" . 'magit-status))

(use-package git-gutter
  :config (progn
            (global-git-gutter-mode +1)
            (custom-set-variables
             (set-face-background 'git-gutter:modified "yellow")
             (set-face-foreground 'git-gutter:added "green")
             (set-face-foreground 'git-gutter:deleted "red")
             '(git-gutter:modified-sign "||") ;; two space
             '(git-gutter:added-sign "++") ;; multiple character is OK
             '(git-gutter:deleted-sign "--"))))

(add-to-list 'auto-mode-alist '("\\.repl$\\'" . clojure-mode))
