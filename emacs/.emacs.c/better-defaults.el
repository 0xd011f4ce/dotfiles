;; better-defaults.el
;; my personal better-defaults 🤗

;; ======== BEHAVIOURAL OVERRIDES	========
(setq auto-save-default nil
			create-lockfiles nil
			inhibit-startup-screen t
			make-backup-files nil)

;; ======== NEW KEYBINDINGS				========
;; tab-bar
(global-set-key (kbd "s-1") (lambda () (interactive) (tab-bar-select-tab 1)))
(global-set-key (kbd "s-2") (lambda () (interactive) (tab-bar-select-tab 2)))
(global-set-key (kbd "s-3") (lambda () (interactive) (tab-bar-select-tab 3)))
(global-set-key (kbd "s-4") (lambda () (interactive) (tab-bar-select-tab 4)))
(global-set-key (kbd "s-5") (lambda () (interactive) (tab-bar-select-tab 5)))
(global-set-key (kbd "s-6") (lambda () (interactive) (tab-bar-select-tab 6)))
(global-set-key (kbd "s-7") (lambda () (interactive) (tab-bar-select-tab 7)))
(global-set-key (kbd "s-8") (lambda () (interactive) (tab-bar-select-tab 8)))
(global-set-key (kbd "s-9") (lambda () (interactive) (tab-bar-select-tab 9)))

(global-set-key (kbd "s-w") (lambda () (interactive) (tab-bar-close-tab)))
(global-set-key (kbd "s-n") (lambda () (interactive) (tab-bar-new-tab)))

;; window-switching
(global-set-key (kbd "s-<left>") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "s-<right>") (lambda () (interactive) (other-window 1)))
