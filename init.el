;; PACKAGES

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (unless (package-installed-p 'gnu-elpa-keyring-update)
    (package-install 'gnu-elpa-keyring-update))
(use-package gnu-elpa-keyring-update)
  (require 'use-package))

;; always ensure!
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Fix elpa signature nonsense
;; (setq package-check-signature nil)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

(defconst load-ignore-files '("my-lisp.el"))

;; Load my elisp stuff
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		           (load-file (concat (file-name-as-directory dir) f))))
        (files (cl-set-exclusive-or load-ignore-files (directory-files dir nil "\\.el$") :test 'string=)))
    (mapc load-it files)))

(setq dir "~/.emacs.d/lisp-init")

(load-directory "~/.emacs.d/lisp-init")


;(require 'which-key)

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
   '(cider lsp-ui lsp-treemacs lsp-ivy dash clojure-mode gnu-elpa-keyring-update lsp-mode dap-mode pcre2el wgrep which-key yasnippet company visual-regexp-steroids resize-window rainbow-delimiters magit lispyville key-chord flycheck-clj-kondo exec-path-from-shell evil-surround evil-snipe evil-matchit emmet-mode dumb-jump counsel-projectile clj-refactor bind-key auto-dim-other-buffers aggressive-indent ag adjust-parens))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "#222"))))
 '(git-gutter:added-sign "++")
 '(ido-first-match ((t (:foreground "IndianRed1" :weight bold))))
 '(ido-indicator ((t (:foreground "yellow1" :width condensed))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "Yellow"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "Red"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "plum1"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "CadetBlue1"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "Magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "Green"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "aquamarine1"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "wheat"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "White"))))
 '(show-paren-match ((t (:background "nil" :underline (:color foreground-color :style wave) :weight bold)))))
