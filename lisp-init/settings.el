;; Get right to emacsing!
(setq inhibit-splash-screen t)
(setq initial-scratch-message "")
(switch-to-buffer "*scratch*")
(tool-bar-mode -1)

;; Please don't litter my filesystem, thanks.
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

;; don't clobber my system clipboard!
(setq save-interprogram-paste-before-kill t)
(setq x-select-enable-clipboard nil)
(setq sentence-end-double-space nil)

;; Update files when changes
(global-auto-revert-mode 1)

;; Line Number stuff.
(global-hl-line-mode 1)
(global-linum-mode 0)

;; Allow narrowing. Turns anything into a "region based" command.
(put 'narrow-to-region 'disabled nil)

;; Emacs needs to see stuff on my path.
(use-package exec-path-from-shell
             :if (memq window-system '(mac ns))
             :config
             (exec-path-from-shell-initialize))
