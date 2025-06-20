(setq cider-print-fn "clojure.core/pprint")

(use-package flycheck-clj-kondo
  :ensure t)

(use-package clj-refactor)

(defun clojure-mode-hooks ()
  (clj-refactor-mode 1)
  (cljr-add-keybindings-with-prefix "s-l"))

(defun lisp-mode-hooks ()
  (electric-indent-mode)
  (electric-pair-mode))

(use-package clojure-mode
  :hook (lisp-mode-hooks . clojure-mode-hook))

(defun rebl-eval-last-sexp ()
  (interactive)
  (let* ((bounds (cider-last-sexp 'bounds))
         (s (cider-last-sexp))
         (reblized (concat "(cognitect.rebl/inspect " s ")")))
    (cider-interactive-eval reblized nil bounds (cider--nrepl-print-request-map))))

;; Similar to C-M-x, but sends to REBL
(defun rebl-eval-defun-at-point ()
  (interactive)
  (let* ((bounds (cider-defun-at-point 'bounds))
         (s (cider-defun-at-point))
         (reblized (concat "(cognitect.rebl/inspect " s ")")))
    (cider-interactive-eval reblized nil bounds (cider--nrepl-print-request-map))))


(local-set-key (kbd "C-S-x") #'rebl-eval-defun-at-point)
(local-set-key (kbd "C-x C-r") #'rebl-eval-last-sexp)

(use-package cider
  :ensure t
  :bind (("C-S-x" . #'rebl-eval-defun-at-point)
         ("C-x C-r" . #'rebl-eval-last-sexp))
:config (progn
          (setq cider-print-fn 'fipp)
          (setq clojure-toplevel-inside-comment-form t)
          (define-key clojure-mode-map (kbd "C-z") 'cider-jack-in-clj)
          (define-key clojure-mode-map (kbd "C-c C-z") 'cider-jack-in)
          (define-key clojure-mode-map (kbd "C-M-x") 'cider-eval-defun-to-comment) ;; primary eval command
          (define-key cider-mode-map (kbd "C-M-S-x") 'cider-pprint-eval-defun-to-comment)
          (define-key cider-mode-map (kbd "C-c C-e") 'cider-eval-defun-to-comment)
          (define-key cider-mode-map (kbd "C-x C-e") 'cider-eval-last-sexp)
          (define-key cider-mode-map (kbd "C-x C-S-e") 'cider-pprint-eval-last-sexp)
          (define-key cider-mode-map (kbd "C-c C-v") 'cider-doc)
          (define-key cider-mode-map (kbd "C-c C-S-v") 'cider-clojuredocs)
          (define-key cider-mode-map (kbd "C-c C-f") 'cider-doc)
          (define-key cider-mode-map (kbd "C-c C-S-f") 'cider-clojuredocs)
          (define-key cider-mode-map (kbd "C-c C-s") 'clj-show-function-source)
          (define-key cider-mode-map (kbd "C-c C-S-s") 'cider-clojuredocs)
          (define-key cider-mode-map (kbd "C-c C-v") 'cider-doc)
          (define-key cider-mode-map (kbd "C-c C-S-v") 'cider-clojuredocs)
          (define-key cider-mode-map (kbd "C-c C-a") 'cider-doc)
          (define-key cider-mode-map (kbd "C-c C-S-a") 'cider-doc)
          (define-key cider-mode-map (kbd "C-c C-l") 'cider-load-buffer)
          (define-key cider-mode-map (kbd "C-c C-r") 'cider-eval-region)
          (define-key cider-mode-map (kbd "C-c f") 'lsp-find-references)
          (define-key cider-mode-map (kbd "C-c n") 'cider-repl-set-ns)
          )) ;;(define-key clojure-mode-map (kbd "C-c C-z") 'inf-clojure)

(setq cider-jump-to-pop-to-buffer-actions
      '((display-buffer-same-window)))

(setq clojure-align-forms-automatically t)

(use-package lispyville
  :config (lispyville-set-key-theme
	       '(operators
	         c-w
	         slurp/barf-cp
	         commentary
	         text-objects
	         additional
	         additional-insert
	         additional-movement
	         (additional-wrap normal visual insert)
	         escape
	         atom-movement
	         commentary)))
