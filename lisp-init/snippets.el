;; Snippets

(use-package yasnippet
  :config (yas-global-mode 1))

(use-package emmet-mode
  :config (setq emmet-move-cursor-between-quotes t)
  :hook (sgml-mode-hook css-mode-hook) ) ;; enable Emmet's css abbreviation.
