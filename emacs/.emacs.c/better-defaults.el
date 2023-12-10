;; better-defaults.el
;; my personal better-defaults 🤗

;; ======== BEHAVIOURAL OVERRIDES	========
(setq auto-save-default nil
			create-lockfiles nil
			inhibit-startup-screen t
			make-backup-files nil)

;; ======== NEW KEYBINDINGS				========
;; some little overrides
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
