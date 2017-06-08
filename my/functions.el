(defun my/kill-other-buffers ()
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun my/ring-agree ()
  (interactive)
  (insert "I agree to license my contributions to each file under the terms given
at the top of each file I changed."))

(defun my/bytecode-recompile ()
  (interactive)
  (byte-recompile-directory package-user-dir nil 'force))
