;; dashboard configurations go here
(setq default-frame-alist
			'((vertical-scroll-bars . nil)
				(horizontal-scroll-bars . nil)
				(internal-border-width . 10)
				(background-color . "black")
				(foreground-color . "white")
				(cursor-color . "deep sky blue")
				(cursor-type . box)))

(require 'dashboard)
(dashboard-setup-startup-hook)

(setq dashboard-startup-banner (expand-file-name "~/.emacs.c/resources/shiki.png"))
(setq dashboard-banner-logo-title "why don't you also become a doll?")
(setq dashboard-center-header t)
(setq dashboard-center-content t)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-items '((projects . 5)
												(agenda . 5)))
(setq dashboard-set-footer nil)

(setq initial-frame-alist '((top . 0) (left . 0)
														(width . 120) (height . 40)))
