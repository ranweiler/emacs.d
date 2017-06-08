;; Ensure we start in $HOME when using a launcher.
(setq default-directory "~")

;; Always highlight the current line.
(global-hl-line-mode t)

;; Enable commands to up and downcase regions.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Set `fill-paragraph` width and behavior.
(setq fill-column 72)
(setq sentence-end-double-space nil)

;; Display current point's column number in modeline.
(column-number-mode t)

;; Visually highlight marked regions.
(transient-mark-mode t)

;; Set default tab handling.
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Don't save word abbrevs when files are saved.
(setq save-abbrevs nil)

;; Highlight matching parentheses.
(show-paren-mode t)
