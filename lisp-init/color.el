;; Colouring

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :custom-face (rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "Yellow"))))
  :custom-face (rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "Red"))))
  :custom-face (rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "plum1"))))
  :custom-face (rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "CadetBlue1"))))
  :custom-face (rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "Magenta"))))
  :custom-face (rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "Green"))))
  :custom-face (rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "aquamarine1"))))
  :custom-face (rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "wheat"))))
  :custom-face (rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "White")))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-dim-other-buffers-face ((t (:background "#222"))))
 '(hl-line ((t (:background "#1b1b1b"))))
 '(ido-first-match ((t (:foreground "IndianRed1" :weight bold))))
 '(ido-indicator ((t (:foreground "yellow1" :width condensed))))
 '(show-paren-match ((t (:background "nil" :underline (:color foreground-color :style wave) :weight bold)))))

;; Theme
(load-theme 'manoj-dark t)

;; So I can see the file name
(set-face-attribute 'mode-line-buffer-id nil :foreground "black"
                    :background "white"
                    :weight 'bold
                    :height 1.3)

;; Always hilight current line
(global-hl-line-mode t)

;; No wordwrapping
(global-visual-line-mode nil)
