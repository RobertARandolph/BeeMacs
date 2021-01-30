;; All languages stuff

(defun all-mode-hooks ()
  (lispyville-mode)
  ;; (lispy-set-key-theme '(lispy c-digits))
  (show-paren-mode 1)
  (turn-on-evil-matchit-mode)
  (electric-pair-mode))

(add-hook 'text-mode-hook 'all-mode-hooks)
(add-hook 'prog-mode-hook 'all-mode-hooks)
