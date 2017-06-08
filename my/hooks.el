;; Show line numbers in programming modes.
(add-hook 'prog-mode-hook 'linum-mode)

;; Delete trailing whitespace when saving.
(add-hook 'before-save-hook 'delete-trailing-whitespace)
