;; Disable extraneous UI elements.
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

;; Disable various startup messages.
(setq initial-scratch-message "")
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;; Don't leave autosave and backup files scattered around the filesystem.
;;
;; TODO: Just keep all backup and temporary files in a fixed location.
;;
;; See:
;; - https://www.emacswiki.org/emacs/AutoSave#toc1
;; - https://www.emacswiki.org/emacs/BackupDirectory#toc2
(setq auto-save-default nil)
(setq make-backup-files nil)

;; Don't save `eshell` history.
(setq eshell-save-history-on-exit nil)

;; Prevent accidental suspending of Emacs in the terminal.
(put 'suspend-frame 'disabled t)

;; Disable bell alerts.
(setq ring-bell-function 'ignore)
