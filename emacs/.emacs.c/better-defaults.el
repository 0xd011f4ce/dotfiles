;; better-defaults.el
;; my personal better-defaults 🤗

;; ======== BEHAVIOURAL OVERRIDES	========
(setq auto-save-default nil
			create-lockfiles nil
			inhibit-startup-screen t
			make-backup-files nil)

;; use only tabs, enable electric pair, rainbow delimiters and rainbow mode
(add-hook 'prog-mode-hook
					(lambda ()
						(setq indent-tabs-mode t
									tab-width 2
									c-basic-offset 2
									python-indent-offset 2)
						(electric-pair-mode)
						(rainbow-delimiters-mode)
						(rainbow-mode)))

;; ======== KEYBINDINGS OVERRIDES ========
(defun my/set-mark-here ()
	"sets a mark at the current point"
	(interactive)
	(push-mark (point) t nil))

;; custom keybindings
(global-set-key (kbd "C-c C-SPC") 'my/set-mark-here)
