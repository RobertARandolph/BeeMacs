;; PACKAGES

(eval-and-compile
  (require 'package)
  (setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  (add-to-list 'load-path "~/.emacs.d/lisp/use-package")
  (require 'use-package))

;; always ensure!
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(defmacro comment (&rest body)
  "Comment out one or more s-expressions."
  nil)

;; Load my elisp stuff
(defun load-directory (dir)
  (let ((load-it (lambda (f)
		           (load-file (concat (file-name-as-directory dir) f)))))
	(mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory "~/.emacs.d/lisp-init")
