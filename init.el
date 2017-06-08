;; Define some helpers for loading custom Elisp.
(defun my/load? (file)
  (load file 'noerror))

(defun my/el-path (name)
  (format "~/.emacs.d/my/%s.el" name))

(defun my/load-config (name)
  (my/load? (my/el-path name)))

;; Tell Emacs to use a separate file for `custom-set-variables` &c.
(setq custom-file (my/el-path "custom"))
(my/load? custom-file)

;; Set up `package` to use the MELPA repository.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Check that we have `use-package` and install if needed.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Load custom configuration files.
(my/load-config "annoyances")
(my/load-config "appearance")
(my/load-config "functions")
(my/load-config "hooks")
(my/load-config "settings")
(my/load-config "kbd")
(my/load-config "lang-modes")

(use-package exec-path-from-shell
  :if (display-graphic-p)
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package multiple-cursors
  :ensure t
  :config
  (bind-key "C-c e" 'mc/edit-lines)
  (bind-key "C-c C-e" 'mc/edit-lines)
  (bind-key "C->" 'mc/mark-next-like-this)
  (bind-key "C-<" 'mc/mark-previous-like-this)
  (bind-key "C-c C-<" 'mc/mark-all-like-this))

;; https://github.com/emacs-helm/helm/wiki
(use-package helm
  :ensure t
  :commands (helm-mode)

  :config
  ;; Globally enable fuzzy matching.
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)

  ;; Use `helm-M-x`.
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key "\C-x\C-m" 'helm-M-x)

  ;; Fit Helm completion window to candidates.
  (helm-autoresize-mode t)

  ;; Use the Helm minibuffer.
  (global-set-key (kbd "C-x b") 'helm-mini)

  ;; Use Helm to find files.
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

;; https://projectile.readthedocs.io/en/latest/
(use-package projectile
  :ensure t
  :config
  ;; When we switch to a project, open its root directory in dired.
  (setq projectile-switch-project-action 'projectile-dired)

  ;; Enable Projectile globally
  (projectile-global-mode))

(use-package helm-projectile
  :ensure t
  :defer t
  :after projectile
  :config
  ;; Use Helm for completion of projectile project names.
  (setq projectile-completion-system 'helm)

  ;; Use Helm versions of common Projectile commands.
  (helm-projectile-on))

;; https://magit.vc/manual/magit/
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x m") 'magit-status))

;; http://www.flycheck.org/en/latest/#the-user-guide
(use-package flycheck
  :ensure t
  :config

  (global-flycheck-mode)

  ;; Don't check Elisp code for errors in documentation and style.
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; https://company-mode.github.io
(use-package company
  :ensure t
  :config
  ;; Helps with function signatures.
  (setq company-tooltip-align-annotations t)

  ;; Allow use of `C-n` and `C-p` to navigate company menu.
  ;; `M-n` and `M-p` are the defaults, and remain active.
  (define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)

  (defun my/company-hook ()
    (bind-key "TAB" 'company-indent-or-complete-common)
    (company-mode))

  ;; Only activate `company-mode` in programming modes.
  (add-hook 'prog-mode-hook 'my/company-hook))

(use-package helm-ag
  :ensure t
  :after helm-projectile
  :config
  ;; The use of `bind-key*` (with asterisk) is necessary to avoid
  ;; shadowing by other modes.
  (bind-key* "C-c p g " 'helm-do-ag-project-root))

(use-package avy
  :ensure t
  :config
  (bind-key "M-." 'avy-goto-word-or-subword-1))
