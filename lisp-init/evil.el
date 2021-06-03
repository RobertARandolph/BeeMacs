;; EVIL

(use-package undo-tree
  :config (global-undo-tree-mode))

(use-package evil
  :after (undo-tree)
  :config (progn
            (evil-mode 1)
            (setq evil-ex-search-case 'insensitive)
            (setq evil-ex-visual-char-range t)
            (when (fboundp 'evil-set-undo-system)
              (evil-set-undo-system 'undo-tree)))
  :bind (:map evil-motion-state-map
              ("S-SPC" . 'evil-scroll-up)
              ("SPC" . 'evil-scroll-down)
              ("<prior>" . 'evil-scroll-up)
              ("<next>" . 'evil-scroll-down)))

(use-package evil-surround
  :config (global-evil-surround-mode 1)
  :after evil)

(use-package evil-matchit
  :after evil)

(use-package evil-snipe)

;; terminal support for evil cursors
(use-package evil-terminal-cursor-changer
  :unless (display-graphic-p)
  :config (evil-terminal-cursor-changer-activate)) ; or (etcc-on)

(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor  'hbar) ; _

(setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "Yellow"         :foreground "black")))
      evil-emacs-state-tag    (propertize " <E> " 'face '((:background "Firebrick"      :foreground "White")))
      evil-insert-state-tag   (propertize " <I> " 'face '((:background "Chartreuse1"    :foreground "Black")))
      evil-replace-state-tag  (propertize " <R> " 'face '((:background "chocolate"      :foreground "black")))
      evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
      evil-visual-state-tag   (propertize " <V> " 'face '((:background "LightBlue1"     :foreground "black")))
      evil-operator-state-tag (propertize " <O> " 'face '((:background "sandy brown"    :foreground "black"))))

;; Enable copy/paste from clipboard
;; Grabbed from https://github.com/syl20bnr/spacemacs/issues/5750 and modified to work
(define-key evil-visual-state-map  (kbd "s-c") (kbd "\"+y"))
(define-key evil-insert-state-map  (kbd "s-v") (kbd "C-r +"))
(define-key evil-ex-completion-map (kbd "s-v") (kbd "C-r +"))
(define-key evil-normal-state-map  (kbd "s-v") (kbd "\"+p"))
(define-key evil-ex-search-keymap  (kbd "s-v") (kbd "C-r +"))

(evil-define-operator evil-eval (beg end)
  "Eval the text"
  :move-point nil
  (save-excursion
    (if (or (eq major-mode 'lisp-mode)
            (or
             (eq major-mode 'clojurec-mode)
             (eq major-mode 'clojurescript-mode)
             (eq major-mode 'clojure-mode)))
       ;;(lisp-eval-region beg end) ;; for using inferior-lisp
        (inf-clojure-eval-region beg end) 
      (eval-region beg end t))))

(define-key evil-normal-state-map "go" 'evil-eval)

(define-key evil-normal-state-map (kbd "*")
  (lambda () (interactive) (swiper (format "\\<%s\\>" (thing-at-point 'symbol)))))
(define-key evil-normal-state-map (kbd "#")
  (lambda () (interactive) (swiper (format "\\<%s\\>" (thing-at-point 'word)))))

;; Write current EVIL state. Used for Talon

(defun write-mode (mode)
  (with-temp-file "~/.emacs.d/mode"
    (insert mode)))

(defun check-evil-state (&optional _)
  (if (not (minibufferp))
      (cond
       ((eq evil-state 'normal) (write-mode "normal"))
       ((eq evil-state 'insert) (write-mode "insert"))
       ((eq evil-state 'visual) (write-mode "visual")))))

(add-hook 'window-buffer-change-functions #'check-evil-state)

(add-hook 'evil-insert-state-entry-hook
          (lambda ()
            (write-mode "insert")))

(add-hook 'evil-visual-state-entry-hook
          (lambda ()
            (write-mode "visual")))

(add-hook 'evil-normal-state-entry-hook
          (lambda ()
            (write-mode "normal")))

(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (setq display-line-numbers 'relative)))

(add-hook 'evil-insert-state-entry-hook
          (lambda ()
            (setq display-line-numbers t)))

(use-package key-chord
             ;; hl acts as 'escape'
             :config (progn (key-chord-mode 1)
                            (key-chord-define evil-insert-state-map  "lh" 'evil-normal-state)
                            (key-chord-define evil-visual-state-map  "lh" 'evil-normal-state)))
