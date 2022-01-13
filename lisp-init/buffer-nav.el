;; Buffer Nav

(use-package dumb-jump
  :config (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package avy
  :after evil
  :config (progn
            (setq 
             avy-style 'de-bruijn
             avy-lead-face '((t (:background "white" :foreground "black")))
             avy-lead-face-0 '((t (:background "white" :foreground "black")))
             avy-lead-face-1 '((t (:background "white" :foreground "black")))
             avy-lead-face-2 '((t (:background "white" :foreground "black"))))
            (define-key evil-motion-state-map (kbd "s-f") #'avy-goto-char-2)
            (define-key evil-motion-state-map (kbd "s-F") #'avy-goto-word-0)
            (setq avy-keys '(?n ?t ?e ?s ?i ?r ?o ?a))))

(require 'avy)

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

(global-set-key (kbd "C-s-p") 'avy-goto-parens)

(comment (use-package which-key
   :after evil
   :init (which-key-mode)
   :config (progn
             (setq which-key-side-window-max-height 0.5)
             (setq which-key-sort-order 'which-key-description-order)
             (setq which-key-idle-delay 0.7)
             (setq which-key-show-operator-state-maps t)
             (setq which-key-allow-evil-operators t))))
