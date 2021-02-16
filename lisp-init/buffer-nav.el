;; Buffer Nav

(use-package dumb-jump
  :config (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package avy
  :after evil
  :config (progn
            (define-key evil-motion-state-map (kbd "s-f") #'avy-goto-char-2)
            (setq avy-keys '(?n ?t ?e ?s ?i ?r ?o ?a))))

(defun avy-goto-parens ()
  (interactive)
  (let ((avy-command this-command))   ; for look up in avy-orders-alist
    (beginning-of-defun)
    (let ((beg (point)))
      (end-of-defun)
      (let ((end (point)))
        (avy-jump "(+\\|\\[+\\|{+" :window-flip nil
                  :beg beg
                  :end end)))))
(add-to-list 'avy-orders-alist '(avy-goto-parens . avy-order-closest))

(global-set-key (kbd "s-p") 'avy-goto-parens)
