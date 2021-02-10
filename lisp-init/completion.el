;; Company
(use-package company
  :bind (:map company-active-map
              ("<return>" . nil)
              ("RET" . nil)
              ("<tab>" . #'company-complete-common-or-cycle)
              ("C-f" . #'company-complete-selection)
              ("C-n" . #'company-select-next)
              ("C-p" . #'company-select-previous)
              ("C-n" . #'company-select-next)
              ("C-p" . #'company-select-previous)
              ("C-n" . #'company-select-next-or-abort)
              ("C-p" . #'company-select-previous-or-abort))
  :config (progn
            (global-company-mode)
            (setq company-idle-delay 0.2)
            (setq company-show-numbers t)
            (setq company-dabbrev-downcase nil)
            (setq company-minimum-prefix-length 2)
            (setq company-require-match 'never) ; Don't require match, so you can still move your cursor as expected.
            (setq company-tooltip-align-annotations t))) ; Align annotation to the right side.
