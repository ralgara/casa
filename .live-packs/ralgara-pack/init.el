;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
;; Saved-desktop heaven
(desktop-save-mode)
;; Fast window switching: g'bye C-x,o...
(windmove-default-keybindings)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(setq shell-command-switch "-ic") ;; ensure shells load ~/.bashrc (-i)

;; C-c left           restore window configuration (e.g. after C-x 1), from winner-mode
;; M-;                comment block

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

