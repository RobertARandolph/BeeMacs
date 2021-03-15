(use-package ace-window
  :config (progn (setq aw-keys '(?n ?t ?e ?s ?i))
               (setq aw-dispatch-always t))
  :bind (("s-m" . 'ace-window)
         ("C-x o" . 'ace-window)))
 
(use-package resize-window
  :bind (("C-c w" . 'resize-window)))

(define-key global-map (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "s-k") (lambda () (interactive) (kill-buffer (current-buffer))))
(define-key global-map (kbd "s-0") (lambda () (interactive) (delete-window)))

;; Lets me focus on the correct buffer after a context switch
(use-package auto-dim-other-buffers
  :config (auto-dim-other-buffers-mode t)
  :custom-face (auto-dim-other-buffers-face ((t (:background "#222")))))
