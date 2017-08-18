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

(use-package yaml-mode :ensure t)

(use-package erlang :ensure t)

(use-package company-go
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-go)))

(use-package go-mode :ensure t)

(use-package idris-mode
  :ensure t
  :config
  (setq idris-repl-banner-functions '()))

(use-package lua-mode
  :ensure t
  :config
  (setq lua-indent-level 4))

(use-package rust-mode :ensure t)

(use-package racer
  :ensure t
  :after company
  :after rust-mode
  :config
  (add-hook 'racer-mode-hook 'company-mode)
  (add-hook 'rust-mode-hook 'racer-mode))

(use-package web-mode
  :ensure t
  :config
  (setq-default web-mode-comment-formats
                '(("javascript" . "//")
                  ("jsx" . "//")
                  ("typescript" . "//")
                  ("tsx") . "//"))
  (setq web-mode-comment-style 2)
  (setq web-mode-auto-quote-style 2)  ;; Use single quotes.
  (add-to-list 'auto-mode-alist '("\\.ts[x]\\'" . web-mode)))
