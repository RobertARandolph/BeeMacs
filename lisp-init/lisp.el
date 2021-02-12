;; LISP

;; (add-to-list 'load-path "/Users/robertrandolph/Documents/Clojure/inf-clojure")
;; (use-package inf-clojure :hook clojure-mode)


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
            (define-key clojure-mode-map (kbd "C-z") 'run-clojure-no-prompt)
            (define-key clojure-mode-map (kbd "C-c C-z") 'run-clojure)
            (define-key clojure-mode-map (kbd "C-M-x") 'lisp-eval-defun) ;; primary eval command
            (define-key clojure-mode-map (kbd "C-c C-e") 'lisp-eval-defun)
            (define-key clojure-mode-map (kbd "C-x C-e") 'lisp-eval-last-sexp)
            (define-key clojure-mode-map (kbd "C-c C-l") 'lisp-load-buffer)
            (define-key clojure-mode-map (kbd "C-c C-n") 'lisp-eval-form-and-next)
            (define-key clojure-mode-map (kbd "C-c C-p") 'lisp-eval-paragraph)
            (define-key clojure-mode-map (kbd "C-c C-r") 'lisp-eval-region)
            (add-hook 'clojure-mode-hook 'lisp-mode-hooks)))

(setq clojure-align-forms-automatically t)

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

(use-package flycheck-clj-kondo)

(defun lisp-mode-hooks ()
  (electric-indent-mode)
  (electric-pair-mode))

(add-hook 'lisp-mode-hook 'lisp-mode-hooks)
(add-hook 'lisp-interaction-mode-hook 'lisp-mode-hooks)
(add-hook 'emacs-lisp-mode-hook 'lisp-mode-hooks)
