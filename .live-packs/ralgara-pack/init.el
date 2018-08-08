;; User pack init file
;;
(live-load-config-file "bindings.el")
(desktop-save-mode)
;; Fast window switching: g'bye C-x,o...
(windmove-default-keybindings)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(setq shell-command-switch "-ic") ;; ensure shells load ~/.bashrc (-i)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (progn
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(require 'use-package)
(setq use-package-always-ensure t);

(use-package ibuffer-vc)

(setq tab-width 4)

(setq
      backup-directory-alist `(("." . "~/.saves"))
      version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them.
