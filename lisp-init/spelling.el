;; Spelling

(require 'flyspell)
(flyspell-mode +1)
(setq flycheck-highlighting-mode 'lines)

(setq ispell-program-name "aspell")
(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))
