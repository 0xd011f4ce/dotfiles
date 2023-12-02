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
(defun my/scroll-up-with-mark ()
	"scrolls up and set a mark at the original position"
	(interactive)
	(push-mark)
	(scroll-up-command))

(defun my/scroll-down-with-mark ()
	"scrolls down and set a mark at the original position"
	(interactive)
	(push-mark)
	(scroll-down-command))

;; i really love marks
(defun my/set-mark-here ()
	"sets a mark at the current point"
	(interactive)
	(push-mark (point) t nil))

(global-set-key (kbd "C-v") 'my/scroll-up-with-mark)
(global-set-key (kbd "M-v") 'my/scroll-down-with-mark)

;; custom keybindings
(global-set-key (kbd "C-c RET") 'my/set-mark-here) ;; C-c RET is C-c C-m
