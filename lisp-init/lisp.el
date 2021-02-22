;; LISP

;; (add-to-list 'load-path "/Users/robertrandolph/Documents/Clojure/inf-clojure")
(use-package inf-clojure
  :hook clojure-mode
  :config (progn
            (define-key clojure-mode-map (kbd "C-M-x") 'inf-clojure-eval-defun) ;; primary eval command
            (define-key clojure-mode-map (kbd "C-c C-e") 'inf-clojure-eval-defun)
            (define-key clojure-mode-map (kbd "C-x C-e") 'inf-clojure-eval-last-sexp)
            (define-key clojure-mode-map (kbd "C-c C-l") 'inf-clojure-eval-buffer)
            (define-key clojure-mode-map (kbd "C-c C-r") 'inf-clojure-eval-region)
            (define-key clojure-mode-map (kbd "C-c C-v") 'inf-clojure-show-var-documentation)
            (define-key clojure-mode-map (kbd "C-c C-s") 'inf-clojure-show-var-source)
            (setq inf-clojure-repl-features
                 '((clojure . ((load . "(clojure.core/load-file \"%s\")")
                               (doc . "(clojure.repl/doc %s)")
                               (source . "(clojure.repl/source %s)")
                               (arglists .
                           "(try
                             (:arglists
                              (clojure.core/meta
                               (clojure.core/resolve
                                (clojure.core/read-string \"%s\"))))
                            (catch #?(:clj Throwable :cljr Exception) e nil))")
                               (apropos . "(doseq [var (sort (clojure.repl/apropos \"%s\"))] (println (str var)))")
                               (ns-vars . "(clojure.repl/dir %s)")
                               (set-ns . "(clojure.core/in-ns '%s)")
                               (macroexpand . "(clojure.core/macroexpand '%s)")
                               (macroexpand-1 . "(clojure.core/macroexpand-1 '%s)")))))
                 (setq inf-clojure-startup-forms '((clojure . "clojure")
                                                   (clojure . "clojure -A:dev")))
                 (advice-add #'inf-clojure :after '(lambda (_) (setq comint-scroll-to-bottom-on-output t)))))



;; Slow, I don't yet understand value over plain clj-kondo
;;(use-package eglot
;;  :config (progn (add-to-list 'eglot-server-programs '(clojure-mode . ("clojure-lsp")))
;;                 (defun project-root (project) (car (project-roots project))))) ;; fix project-root issue with use-package

(use-package flycheck-clj-kondo)

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

;; Clojure

(defun lisp-load-buffer ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (< (point) (point-max))
      (lisp-eval-form-and-next))))

(use-package clojure-mode
  :config (progn
            (require 'flycheck-clj-kondo)
            ;;(define-key clojure-mode-map (kbd "C-z") 'run-clojure-no-prompt)
            ;;(define-key clojure-mode-map (kbd "C-c C-z") 'run-clojure)
            ;;(define-key clojure-mode-map (kbd "C-M-x") 'lisp-eval-defun) ;; primary eval command
            ;;(define-key clojure-mode-map (kbd "C-c C-e") 'lisp-eval-defun)
            ;;(define-key clojure-mode-map (kbd "C-x C-e") 'lisp-eval-last-sexp)
            ;;(define-key clojure-mode-map (kbd "C-c C-l") 'lisp-load-buffer)
            ;;(define-key clojure-mode-map (kbd "C-c C-n") 'lisp-eval-form-and-next)
            ;;(define-key clojure-mode-map (kbd "C-c C-p") 'lisp-eval-paragraph)
            ;;(define-key clojure-mode-map (kbd "C-c C-r") 'lisp-eval-region)
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
            (define-key clojure-mode-map (kbd "C-c C-z") 'inf-clojure)
            (add-hook 'clojure-mode-hook 'lisp-mode-hooks)))

(setq clojure-align-forms-automatically t)

(comment
 (setq inferior-lisp-program "clojure")

 (defvar clj-repl-command)

 (defvar clj-repl-command-history '())

 (savehist-mode 1)

 (add-to-list 'savehist-additional-variables 'clj-repl-command-history)

 (defun run-clojure-no-prompt ()
   (interactive)
   (if (and (boundp 'clj-repl-command)
            (stringp (car clj-repl-command))) 
       (run-clojure-command (car clj-repl-command))
     (run-clojure-command "clojure")))

 (defun run-clojure (cmd)
   (interactive (list
                 (if (boundp 'clj-repl-command)
                     (let ((first-command (car clj-repl-command))
                           (rest-commands (if clj-repl-command-history
                                              (append (cdr clj-repl-command) clj-repl-command-history)
                                            (cdr clj-repl-command))))
                       (read-from-minibuffer "Command:" first-command nil nil 'rest-commands))
                   (read-from-minibuffer "Command:" "clojure" nil nil 'clj-repl-command-history))))
   (run-clojure-command cmd))

 (defun run-clojure-command (cmd)
   (let ((dd (if (and (fboundp 'clojure-project-root-path)
                      (stringp (clojure-project-root-path)))
                 (clojure-project-root-path)
               default-directory))
         cb (curent-buffer))
     (cd dd)
     (add-to-list 'clj-repl-command-history cmd)
     (if (boundp 'clj-environment)
         (let ((process-environment (append process-environment clj-environment)))
           (run-lisp cmd))
       (run-lisp cmd))
     (switch-to-buffer cb)
     (switch-to-buffer-other-window "*inferior-lisp*")))

 (setq lisp-function-doc-command
       "(clojure.repl/doc %s)\n")

 (setq lisp-show-variable-documentation
       "(clojure.repl/doc %s)\n")

 (setq lisp-arglist-command
       "(str \"%1$s args: \"
            (or (some-> '%1$s resolve meta :arglists)
                \"Not Found\"))\n")

 ;; make inferior-lisp repl scroll on new output
 (setq comint-scroll-to-bottom-on-output t)
 )

(use-package flycheck-clj-kondo)

(defun lisp-mode-hooks ()
  (electric-indent-mode)
  (electric-pair-mode))

(add-hook 'lisp-mode-hook 'lisp-mode-hooks)
(add-hook 'lisp-interaction-mode-hook 'lisp-mode-hooks)
(add-hook 'emacs-lisp-mode-hook 'lisp-mode-hooks)
