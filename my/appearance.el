(use-package plan9-theme :ensure t :disabled)
(use-package sunny-day-theme :ensure t :disabled)

(defun my/set-height (height)
  (interactive)
  (set-face-attribute 'default nil :height height))

(defun my/set-face (face)
  (interactive)
  (set-face-attribute 'default nil :font face)
  (set-face-attribute 'fixed-pitch nil :font face)
  (set-frame-font face nil t))

(defun my/font-increment ()
  (interactive)
  (let ((old-face-attribute (face-attribute 'default :height)))
    (set-face-attribute 'default nil :height (+ old-face-attribute 5))))

(defun my/font-decrement ()
  (interactive)
  (let ((old-face-attribute (face-attribute 'default :height)))
    (set-face-attribute 'default nil :height (- old-face-attribute 5))))

(global-set-key (kbd "C-x C-=") 'my/font-increment)
(global-set-key (kbd "C-x C--") 'my/font-decrement)

(defun my/setup-windows ()
  (interactive)
  ;; Load the `sunny-day` theme, don't require it to be whitelisted, and
  ;; enable it.
  (load-theme 'sunny-day t)

  (my/set-face "Consolas")
  (my/set-height 80)

  (toggle-frame-fullscreen))

(add-hook 'window-setup-hook 'my/setup-windows)
