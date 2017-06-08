(add-hook
 'c-mode-common-hook
 (lambda ()
   (setq c-basic-offset 4)
   (setq c-default-style "k&r")
   (setq comment-start "//")
   (setq comment-end "")))

(add-hook
 'sh-mode-hook
 (lambda ()
   (setq sh-basic-offset 2)
   (setq sh-indentation 2)))

(use-package markdown-mode :ensure t)

(use-package toml-mode :ensure t)

(use-package idris-mode :ensure t)

(use-package rust-mode :ensure t)
