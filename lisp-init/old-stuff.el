;; Old settings that might be useful in the futer
;; i.e. things that I go back and forth on all the time.



;; (add-hook 'cider-repl-mode-hook 'lisp-mode-hooks)
;; (require 'cider-util)

;; (defun rebl-eval-last-sexp ()
;;   (interactive)
;;   (let* ((bounds (cider-last-sexp 'bounds))
;;          (s (cider-last-sexp))
;;          (reblized (concat "(cognitect.rebl/inspect " s ")")))
;;     (cider-interactive-eval reblized nil bounds (cider--nrepl-print-request-map))))

;; (defun rebl-eval-defun-at-point ()
;;   (interactive)
;;   (let* ((bounds (cider-defun-at-point 'bounds))
;;          (s (cider-defun-at-point))
;;          (reblized (concat "(cognitect.rebl/inspect " s ")")))
;;     (cider-interactive-eval reblized nil bounds (cider--nrepl-print-request-map))))

;; Make cider error buffer always show on bottom and not clobber current window setup
;; (add-to-list 'display-buffer-alist
;;              `(,(rx bos "*cider-error*" eos)
;;                (display-buffer-reuse-window
;;                 display-buffer-in-side-window)
;;                (reusable-frames . visible)
;;                (side            . bottom)
;;                (window-height   . 0.4)))
;; Use this instead of C-c C-v C-f C-c C-d ... No, really, that's the default!
;; (add-hook 'cider-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-S-x") #'rebl-eval-defun-at-point)
;;             (local-set-key (kbd "C-x C-r") #'rebl-eval-last-sexp)
;;             (local-set-key (kbd "C-M-S-x") #'cider-pprint-eval-defun-to-comment)))

;; Org Mode - The best thing since sliced cinnamon-raisin bread
;;(org-clock-persistence-insinuate)
;;(setq org-clock-report-include-clocking-task t)
;;(setq org-clock-persist t)
;;(setq org-clock-in-resume t)
;;(setq org-clock-out-remove-zero-time-clocks t)
;;(setq org-clock-out-when-done t)
;;(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;;(setq org-clock-report-include-clocking-task t)
;;(setq org-pretty-entities t)(setq org-clock-persist-query-resume nil)
;;(setq org-agenda-window-setup (quote current-window))
;;(setq org-agenda-files '("~/Documents/Cognitect/Employ/"))
;;(setq org-default-notes-file "~/Documents/Cognitect/Employ/todo.org")
;;(setq org-clock-persist 'history)
;;(setq org-todo-keywords
      ;;'((sequence "TODO" "IN PROGRESS" "WAITING" "|" "DONE" "DELEGATED" "CANCELLED")))
;;(setq org-todo-keywords
      ;;'((sequence "TODO(t)" "IN PROGRESS(p!)" "WAITING(w@/!)" "|" "DONE(d!)" "DELEGATED(l@/!)" "CANCELED(c@/!)")))
;;(setq org-todo-keyword-faces
      ;;'(("TODO" . org-warning)
        ;;("IN PROGRESS" . "yellow")
        ;;("WAITING" . (:foreground "BLUE" :weight bold))
        ;;("CANCELED" . (:foreground "RED" :weight bold))
        ;;("Done")))
;;
;;(add-hook 'org-mode-hook 'visible-mode)
;;
;;(global-set-key (kbd "C-c l") 'org-store-link)
;;(global-set-key (kbd "C-c a") 'org-agenda)
;;(global-set-key (kbd "C-c c") 'org-capture)

;; Company
;;(add-hook 'after-init-hook 'global-company-mode)
;;
;;(setq company-frontends
;;      '(company-pseudo-tooltip-unless-just-one-frontend
;;        company-preview-frontend
;;        company-echo-metadata-frontend))
;;(global-company-fuzzy-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company visual-regexp-steroids resize-window rainbow-delimiters magit lispyville key-chord flycheck-clj-kondo exec-path-from-shell evil-surround evil-snipe evil-matchit emmet-mode dumb-jump counsel-projectile clj-refactor bind-key auto-dim-other-buffers aggressive-indent ag adjust-parens)))
