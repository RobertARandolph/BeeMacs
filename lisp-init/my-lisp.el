;; LISP

;; (add-to-list 'load-path "/Users/robertrandolph/Documents/Clojure/inf-clojure")
;;(use-package inf-clojure
;;  :config (progn
;;            (define-key clojure-mode-map (kbd "C-M-x") 'inf-clj-eval-defun) ;; primary eval command
;;            (define-key clojure-mode-map (kbd "C-c C-e") 'inf-clj-eval-defun)
;;            (define-key clojure-mode-map (kbd "C-x C-e") 'inf-clojure-eval-last-sexp)
;;            (define-key clojure-mode-map (kbd "C-c C-l") 'inf-clojure-eval-buffer)
;;            (define-key clojure-mode-map (kbd "C-c C-r") 'inf-clojure-eval-region)
;;            (define-key clojure-mode-map (kbd "C-c C-v") 'inf-clojure-show-var-documentation)
;;            (define-key clojure-mode-map (kbd "C-c C-s") 'inf-clojure-show-var-source)
;;            (setq inf-clojure-repl-features
;;                 '((clojure . ((load . "(clojure.core/load-file \"%s\")")
;;                               (doc . "(clojure.repl/doc %s)")
;;                               (source . "(clojure.repl/source %s)")
;;                               (arglists .
;;                           "(try
;;                             (:arglists
;;                              (clojure.core/meta
;;                               (clojure.core/resolve
;;                                (clojure.core/read-string \"%s\"))))
;;                            (catch #?(:clj Throwable :cljr Exception) e nil))")
;;                               (apropos . "(doseq [var (sort (clojure.repl/apropos \"%s\"))] (println (str var)))")
;;                               (ns-vars . "(clojure.repl/dir %s)")
;;                               (set-ns . "(clojure.core/in-ns '%s)")
;;                               (macroexpand . "(clojure.core/macroexpand '%s)")
;;                               (macroexpand-1 . "(clojure.core/macroexpand-1 '%s)")))))
;;                 (setq inf-clojure-startup-forms '((clojure . "clojure")
;;                                                   (clojure . "clojure -A:dev")))
;;                 (advice-add #'inf-clojure :after '(lambda (_) (setq comint-scroll-to-bottom-on-output t)))))

;; Slow, I don't yet understand value over plain clj-kondo
;;(use-package eglot
;;  :config (progn (add-to-list 'eglot-server-programs '(clojure-mode . ("clojure-lsp")))
;;                 (defun project-root (project) (car (project-roots project))))) ;; fix project-root issue with use-package

;; (use-package flycheck-clj-kondo)
;; 
;; (use-package lispyville
;;   :config (lispyville-set-key-theme
;; 	       '(opeaators
;; 	         c-w
;; 	         slurp/barf-cp
;; 	         commentary
;; 	         text-objects
;; 	         additional
;; 	         additional-insert
;; 	         additional-movement
;; 	         (additional-wrap normal visual insert)
;; 	         escape
;; 	         atom-movement
;; 	         commentary)))
;; 
;; ;; Clojure
;; 
;; (defun lisp-load-buffer ()
;;   (interactive)
;;   (save-excursion
;;     (goto-char (point-min))
;;     (while (< (point) (point-max))
;;       (lisp-eval-form-and-next))))
;; 
;; (use-package flycheck-clj-kondo)
;; 
;; (defun lisp-mode-hooks ()
;;   (electric-indent-mode)
;;   (electric-pair-mode))
;; 
;; (add-hook 'lisp-mode-hook 'lisp-mode-hooks)
;; (add-hook 'lisp-interaction-mode-hook 'lisp-mode-hooks)
;; (add-hook 'emacs-lisp-mode-hook 'lisp-mode-hooks)
;; 
;; (use-package clojure-mode
;;   :config (progn
;;             (require 'flycheck-clj-kondo)
;;             (define-key clojure-mode-map (kbd "C-z") 'run-clojure-no-prompt)
;;             (define-key clojure-mode-map (kbd "C-c C-z") 'run-clojure)
;;             (define-key clojure-mode-map (kbd "C-c C-S-z") 'run-clojure-network)
;;             (define-key clojure-mode-map (kbd "C-M-x") 'clj-eval-defun) ;; primary eval command
;;             (define-key clojure-mode-map (kbd "C-M-S-x") 'clj-eval-defun-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-e") 'clj-eval-defun)
;;             (define-key clojure-mode-map (kbd "C-x C-e") 'lisp-eval-last-sexp)
;;             (define-key clojure-mode-map (kbd "C-x C-S-e") 'clj-eval-last-sexp-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-S-x") 'clj-eval-defun-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-v") 'lisp-show-variable-documentation)
;;             (define-key clojure-mode-map (kbd "C-c C-S-v") 'clj-show-variable-documentation-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-f") 'lisp-show-function-documentation)
;;             (define-key clojure-mode-map (kbd "C-c C-S-f") 'clj-show-function-documentation-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-s") 'clj-show-function-source)
;;             (define-key clojure-mode-map (kbd "C-c C-S-s") 'clj-show-function-source-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-v") 'clj-show-var-source)
;;             (define-key clojure-mode-map (kbd "C-c C-S-v") 'clj-show-var-source-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-a") 'lisp-show-arglist)
;;             (define-key clojure-mode-map (kbd "C-c C-S-a") 'clj-show-arglist-and-print)
;;             (define-key clojure-mode-map (kbd "C-c C-l") 'lisp-load-buffer)
;;             (define-key clojure-mode-map (kbd "C-c C-n") 'lisp-eval-form-and-next)
;;             (define-key clojure-mode-map (kbd "C-c C-p") 'lisp-eval-paragraph)
;;             (define-key clojure-mode-map (kbd "C-c C-r") 'lisp-eval-region)
;;             (setq clojure-refactor-map-prefix (kbd "s-l"))
;;             (defvar clojure-refactor-map
;;               (let ((map (make-sparse-keymap)))
;;                 (define-key map (kbd "t") #'clojure-thread)
;;                 (define-key map (kbd "u") #'clojure-unwind)
;;                 (define-key map (kbd "f") #'clojure-thread-first-all)
;;                 (define-key map (kbd "l") #'clojure-thread-last-all)
;;                 (define-key map (kbd "p") #'clojure-cycle-privacy)
;;                 (define-key map (kbd "(") #'clojure-convert-collection-to-list)
;;                 (define-key map (kbd "'") #'clojure-convert-collection-to-quoted-list)
;;                 (define-key map (kbd "{") #'clojure-convert-collection-to-map)
;;                 (define-key map (kbd "[") #'clojure-convert-collection-to-vector)
;;                 (define-key map (kbd "#") #'clojure-convert-collection-to-set)
;;                 (define-key map (kbd "i") #'clojure-cycle-if)
;;                 (define-key map (kbd "w") #'clojure-cycle-when)
;;                 (define-key map (kbd "o") #'clojure-cycle-not)
;;                 (define-key map (kbd "n i") #'clojure-insert-ns-form)
;;                 (define-key map (kbd "n h") #'clojure-insert-ns-form-at-point)
;;                 (define-key map (kbd "n u") #'clojure-update-ns)
;;                 (define-key map (kbd "n s") #'clojure-sort-ns)
;;                 (define-key map (kbd "n r") #'clojure-rename-ns-alias)
;;                 (define-key map (kbd "s i") #'clojure-introduce-let)
;;                 (define-key map (kbd "s m") #'clojure-move-to-let)
;;                 (define-key map (kbd "s f") #'clojure-let-forward-slurp-sexp)
;;                 (define-key map (kbd "s b") #'clojure-let-backward-slurp-sexp)
;;                 (define-key map (kbd "a") #'clojure-add-arity)
;;                 map)
;;               "Keymap for Clojure refactoring commands.")
;;             (define-key clojure-mode-map clojure-refactor-map-prefix 'clojure-refactor-map)
;;             ;;(define-key clojure-mode-map (kbd "C-c C-z") 'inf-clojure)
;;             (add-hook 'clojure-mode-hook 'lisp-mode-hooks)))
;; 
;; (setq clojure-align-forms-automatically t)
;; 
;;  (setq inferior-lisp-program "clojure")
;; 
;;  (defvar clj-repl-command)
;;  (defvar clj-repl-host)
;;  (defvar clj-repl-port)
;; 
;; ;; Buffer eval'd from
;;  (defvar clojure-current-buffer)
;; ;; Point of end of function eval'd
;;  (defvar clojure-last-eval-end)
;; 
;;  (defvar clj-repl-command-history '())
;; 
;;  (savehist-mode 1)
;; 
;;  (add-to-list 'savehist-additional-variables 'clj-repl-command-history)
;; 
;; ;; Do things after 
;; (add-hook 'comint-output-filter-functions #'clojure-preoutput-filter)
;; 
;; (defun clojure-preoutput-filter (str)
;;   "Preprocess the output STR from interactive commands."
;;   (if clojure-current-buffer ;; eval command sets the current buffer if it's an "print to buffer" type command
;;       (with-current-buffer clojure-current-buffer
;;         (save-excursion
;;           (goto-char clojure-last-eval-end)
;;           (let* ((output (replace-regexp-in-string "^" ";; " ;; add comments
;;                                                   (replace-regexp-in-string "^[^> \n]*>+:? *" "" str))) ;; remove prompt
;;                 (l (length output)))
;;             (insert (concat "\n\n"
;;                             (if (> (length output) 4)
;;                                 (substring output 0 (- l 4))
;;                               output))  ;; remove newline and spaces
;;                     "\n")
;;             (setq clojure-current-buffer nil)))))) ;; don't send next one out!
;; 
;;  (defun run-clojure-no-prompt ()
;;    (interactive)
;;    (if (and (boundp 'clj-repl-command)
;;             (stringp (car clj-repl-command))) 
;;        (run-clojure-command (car clj-repl-command))
;;      (run-clojure-command "clojure")))
;; 
;;  (defun run-clojure (cmd)
;;    (interactive (list
;;                  (if (boundp 'clj-repl-command)
;;                      (let ((first-command (car clj-repl-command))
;;                            (rest-commands (if clj-repl-command-history
;;                                               (append (cdr clj-repl-command) clj-repl-command-history)
;;                                             (cdr clj-repl-command))))
;;                        (read-from-minibuffer "Command:" first-command nil nil 'rest-commands))
;;                    (read-from-minibuffer "Command:" "clojure" nil nil 'clj-repl-command-history))))
;;    (run-clojure-command cmd))
;; 
;;  (defun run-clojure-network (host port)
;;    (interactive (list
;;                  (if (boundp 'clj-repl-host)
;;                      (let ((first-command (car clj-repl-host))
;;                            (rest-commands (if clj-repl-host-history
;;                                               (append (cdr clj-repl-host) clj-repl-host-history)
;;                                             (cdr clj-repl-host))))
;;                        (read-from-minibuffer "Host:" first-command nil nil 'rest-commands))
;;                    (read-from-minibuffer "Host:" "localhost" nil nil 'clj-repl-host-history))
;;                  (if (boundp 'clj-repl-port)
;;                      (let ((first-command (car clj-repl-port))
;;                            (rest-commands (if clj-repl-port-history
;;                                               (append (cdr clj-repl-port) clj-repl-port-history)
;;                                             (cdr clj-repl-port))))
;;                        (read-from-minibuffer "Port:" first-command nil nil 'rest-commands))
;;                    (read-from-minibuffer "Port:" "5555" nil nil 'clj-repl-port-history))))
;;    (run-clojure-command (concat "nc " host " " port) t))
;; 
;;  (defun run-clojure-command (cmd &optional net)
;;    (let ((dd (if (and (fboundp 'clojure-project-root-path)
;;                       (stringp (clojure-project-root-path)))
;;                  (clojure-project-root-path)
;;                (let ((dir-locals-dir (car (dir-locals-find-file (buffer-file-name)))))
;;                  (if dir-locals-dir
;;                      dir-locals-dir
;;                    default-directory))))
;;          (cb (current-buffer)))
;;      (cd dd)
;;      (if (not net)
;;       (add-to-list 'clj-repl-command-history cmd))
;;      (if (boundp 'lisp-environment)
;;          (let ((process-environment (append process-environment clj-environment)))
;;            (run-lisp cmd))
;;        (run-lisp cmd))
;;      (switch-to-buffer cb)
;;      (switch-to-buffer-other-window "*inferior-lisp*")))
;; 
;; (setq clj-function-source-command
;;        "(clojure.repl/source %s)\n")
;; 
;;  (setq lisp-function-doc-command
;;        "(clojure.repl/doc %s)\n")
;; 
;; (setq lisp-var-doc-command
;;       "(clojure.repl/doc %s)\n")
;; 
;;  (setq lisp-arglist-command
;;        "(str \"%1$s args: \"
;;             (or (some-> '%1$s resolve meta :arglists)
;;                 \"Not Found\"))\n")
;; 
;;  ;; make inferior-lisp repl scroll on new output
;;  (setq comint-scroll-to-bottom-on-output t)
;;  
;; ;; regex, not plain string
;; ;; TODO allow define in dir-local
;; (defconst ignored-forms '("comment"))
;; 
;; (defun check-ignored-forms (forms)
;;   (interactive "P")
;;   (let ((ret nil))
;;     (dolist (form ignored-forms)
;;       (when (looking-at (concat "(" form))
;;         (setq ret 't)))
;;     ret))
;; 
;; (defun clj-do-defun (do-region)
;;   "Send the current defun to the inferior Lisp process.
;; The actually processing is done by `do-string' and `do-region'
;;  which determine whether the code is compiled before evaluation.
;; DEFVAR forms reset the variables to the init values. Ignores (comment) forms."
;;   (save-excursion
;;     ;; if there's a form after the cursor, jump into it before parsing.
;;     ;; lisp-eval-defun doesn't do this. Unsure if we should?
;;     ;;(when (looking-at "(")
;;     ;;  (down-list))
;;     (let ((err nil)
;;           (forms '()))
;;       ;; build a list of sexp start locations before the cursor position
;;       ;; error on top-level form and continue
;;       (while (not (eq err 1))
;;         (condition-case nil
;;             (backward-up-list nil t)
;;           (error (setq err 1)))
;;         (add-to-list 'forms (point)))
;;       ;; We're at the top-level defun now, check for comment
;;       ;; This could check against a list of forms to ignore and
;;       ;; climb up to the first not-ignored form
;;       (if (check-ignored-forms ignored-forms) ;;(looking-at "(comment")
;;           (if (or (eq 1 (length forms)) (null forms))
;;               (message "No top level form, or top level form ignored.")
;;             (progn
;;               (goto-char (cadr forms))
;;               (forward-sexp)
;;               (setq clojure-last-eval-end (point)) ;; set function end for eval-and-print
;;               (funcall do-region (cadr forms) (point))))
;;         (progn
;;          (let ((start (point)))
;;            (forward-sexp)
;;            (setq clojure-last-eval-end (point)) ;; set function end for eval-and-print
;;            (funcall do-region start (point))))))))
;; 
;; (defun clj-eval-defun (&optional and-go buf)
;;   "Send the current defun to the inferior Lisp process.
;; DEFVAR forms reset the variables to the init values.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "P")
;;   (setq clojure-current-buffer buf) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (clj-do-defun 'clj-eval-region)
;;   (if and-go (switch-to-lisp t)))
;; 
;; (defun clj-eval-region (start end &optional and-go)
;;   "Send the current region to the inferior Lisp process.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "r\nP")
;;   (comint-send-region (inferior-lisp-proc) start end)
;;   (comint-send-string (inferior-lisp-proc) "\n")
;;   (if and-go (switch-to-lisp t)))
;; 
;; (defun clj-eval-defun-and-print (&optional and-go)
;;   "Send the current defun to the inferior Lisp process.
;; DEFVAR forms reset the variables to the init values.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "P")
;;   (clj-eval-defun and-go (current-buffer)))
;; 
;; (defun clj-eval-last-sexp (&optional and-go buf)
;;   "Send the current defun to the inferior Lisp process.
;; DEFVAR forms reset the variables to the init values.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "P")
;;   (setq clojure-current-buffer buf) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (setq clojure-last-eval-end (point))
;;   (clj-eval-region (save-excursion (backward-sexp) (point)) (point) and-go)
;;   (if and-go (switch-to-lisp t)))
;; 
;; (defun clj-eval-last-sexp-and-print (&optional and-go)
;;   "Send the current defun to the inferior Lisp process.
;; DEFVAR forms reset the variables to the init values.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "P")
;;   (clj-eval-last-sexp and-go (current-buffer)))
;; 
;; (defun clj-show-function-source (fn)
;;   (interactive (lisp-symprompt "Function source" (lisp-fn-called-at-pt)))
;;   (comint-proc-query (inferior-lisp-proc)
;;                      (format clj-function-source-command fn)) )
;; 
;; (defun clj-show-function-source-and-print (fn)
;;   (interactive (lisp-symprompt "Function source" (lisp-fn-called-at-pt)))
;;   (setq clojure-current-buffer (current-buffer)) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (setq clojure-last-eval-end (point))
;;   (comint-proc-query (inferior-lisp-proc)
;;                      (format clj-function-source-command fn)) )
;; 
;; (defun clj-show-var-source (fn)
;;   (interactive (lisp-symprompt "Var source" (lisp-var-at-pt)))
;;   (comint-proc-query (inferior-lisp-proc)
;;                      (format clj-function-source-command fn)) )
;; 
;; (defun clj-show-var-source-and-print (fn)
;;   (interactive (lisp-symprompt "Var source" (lisp-var-at-pt)))
;;   (setq clojure-current-buffer (current-buffer)) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (setq clojure-last-eval-end (line-end-position))
;;   (comint-proc-query (inferior-lisp-proc)
;;                      (format clj-function-source-command fn)) )
;; 
;; (defun clj-show-function-documentation-and-print ()
;;   (interactive)
;;   (setq clojure-current-buffer (current-buffer)) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (setq clojure-last-eval-end (line-end-position))
;;   (call-interactively 'lisp-show-function-documentation))
;; 
;; (defun clj-show-variable-documentation-and-print ()
;;   (interactive)
;;   (setq clojure-current-buffer (current-buffer)) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (setq clojure-last-eval-end (line-end-position))
;;   (call-interactively 'lisp-show-variable-documentation))
;; 
;; (defun clj-show-arglist-and-print ()
;;   (interactive)
;;   (setq clojure-current-buffer (current-buffer)) ;; comint-output-filter prints to sending buffer if this is a buffer
;;   (setq clojure-last-eval-end (line-end-position))
;;   (call-interactively 'lisp-show-arglist))
;; 
;; ;; add print to other cmds
;; 
;; ;; source to repl?
;; 
;; (defun inf-clj-eval-defun (&optional and-go)
;;   "Send the current defun to the inferior Lisp process.
;; DEFVAR forms reset the variables to the init values.
;; Prefix argument means switch to the Lisp buffer afterwards."
;;   (interactive "P")
;;   (clj-do-defun 'inf-clojure-eval-region)
;;   (if and-go (switch-to-lisp t)))
