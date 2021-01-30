;; Buffer Nav

(use-package dumb-jump
  :config (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package avy
  :after evil
  :config (progn
            (define-key evil-motion-state-map (kbd "C-;") #'avy-goto-char-2)
            (setq avy-keys (nconc (number-sequence ?1 ?9)
                                  '(?0)))))
