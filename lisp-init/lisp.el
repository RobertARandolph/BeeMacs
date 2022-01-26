(setq cider-print-fn "clojure.core/pprint")

(use-package cider
  :ensure t
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
            (setq clojure-refactor-map-prefix (kbd "s-l"))
            (defvar clojure-refactor-map
              (let ((map (make-sparse-keymap)))
                (define-key map (kbd "t") #'clojure-thread)
                (define-key map (kbd "u") #'clojure-unwind)
                (define-key map (kbd "f") #'clojure-thread-first-all)
                (define-key map (kbd "l") #'clojure-thread-last-all)
                (define-key map (kbd "p") #'clojure-cycle-privacy)
                (define-key map (kbd "(") #'clojure-convert-collection-to-list)
                (define-key map (kbd "'") #'clojure-convert-collection-to-quoted-list)
                (define-key map (kbd "{") #'clojure-convert-collection-to-map)
                (define-key map (kbd "[") #'clojure-convert-collection-to-vector)
                (define-key map (kbd "#") #'clojure-convert-collection-to-set)
                (define-key map (kbd "i") #'clojure-cycle-if)
                (define-key map (kbd "w") #'clojure-cycle-when)
                (define-key map (kbd "o") #'clojure-cycle-not)
                (define-key map (kbd "n i") #'clojure-insert-ns-form)
                (define-key map (kbd "n h") #'clojure-insert-ns-form-at-point)
                (define-key map (kbd "n u") #'clojure-update-ns)
                (define-key map (kbd "n s") #'clojure-sort-ns)
                (define-key map (kbd "n r") #'clojure-rename-ns-alias)
                (define-key map (kbd "s i") #'clojure-introduce-let)
                (define-key map (kbd "s m") #'clojure-move-to-let)
                (define-key map (kbd "s f") #'clojure-let-forward-slurp-sexp)
                (define-key map (kbd "s b") #'clojure-let-backward-slurp-sexp)
                (define-key map (kbd "a") #'clojure-add-arity)
                map)
              "Keymap for Clojure refactoring commands.")
            (define-key clojure-mode-map clojure-refactor-map-prefix 'clojure-refactor-map)
            ;;(define-key clojure-mode-map (kbd "C-c C-z") 'inf-clojure)
            (add-hook 'clojure-mode-hook 'lisp-mode-hooks)))

(setq cider-jump-to-pop-to-buffer-actions
      '((display-buffer-same-window)))

(defun lisp-mode-hooks ()
  (electric-indent-mode)
  (electric-pair-mode))

(setq clojure-align-forms-automatically t)

(use-package lispyville
  :config (lispyville-set-key-theme
	       '(opeaators
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
