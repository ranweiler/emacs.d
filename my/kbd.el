;; Remap `C-j` to `C-x`
(define-key key-translation-map "\C-j" "\C-x")

;; Make room for nice user prefix
(global-set-key (kbd "M-j") nil)

;; Cycle through visible windows.
(global-set-key (kbd "C-x C-o") 'other-window)

;; Ensure `dired-x` is loaded so we can use `dired-jump`, and bind it.
(use-package dired-x
  :bind ("C-x j" . dired-jump))
