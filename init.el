;; PACKAGES

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))
  (add-to-list 'load-path "~/.emacs.d/lisp/use-package")
  (require 'use-package))

;; always ensure!
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

;; Load my elisp stuff
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		           (load-file (concat (file-name-as-directory dir) f)))))
	(mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory "~/.emacs.d/lisp-init")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "||")
 '(nil nil t)
 '(package-selected-packages
   '(evil-terminal-cursor-changer git-gutter diff-hl diff-hl-mode company visual-regexp-steroids resize-window rainbow-delimiters magit lispyville key-chord flycheck-clj-kondo exec-path-from-shell evil-surround evil-snipe evil-matchit emmet-mode dumb-jump counsel-projectile clj-refactor bind-key auto-dim-other-buffers aggressive-indent ag adjust-parens)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "#222"))))
 '(hl-line ((t (:background "#1b1b1b"))))
 '(ido-first-match ((t (:foreground "IndianRed1" :weight bold))))
 '(ido-indicator ((t (:foreground "yellow1" :width condensed))))
 '(show-paren-match ((t (:background "nil" :underline (:color foreground-color :style wave) :weight bold)))))
