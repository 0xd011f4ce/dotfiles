;; better-defaults.el
;; my personal better-defaults 🤗

;; modify the behavious of C-v M-v M-< M-> to add a mark before scrolling
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

(global-set-key (kbd "C-c RET") 'my/set-mark-here) ;; C-c RET is C-c C-m

(provide 'better-defaults)
