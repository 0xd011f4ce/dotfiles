;; disable all those ugly emacs thingies
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

;; show hex colours in text buffers as well
(add-hook 'text-mode-hook #'rainbow-mode)

;; show lines and cols
(global-display-line-numbers-mode 1)
(column-number-mode 1)

(dolist (mode '(org-mode-hook
								term-mode-hook
								shell-mode-hook
								eshell-mode-hook
								treemacs-mode-hook))
	(add-hook mode (lambda () (display-line-numbers-mode 0))))

;; 80 cols delimiter
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; all the icons
(when (display-graphic-p)
	(require 'all-the-icons)
	(require 'treemacs-all-the-icons)
	
	(unless (member "all-the-icons" (font-family-list))
		(all-the-icons-install-fonts))
	(treemacs-load-theme "all-the-icons")

	;; make the window translucent
	(set-frame-parameter (selected-frame) 'alpha '(95 . 100))
	(add-to-list 'default-frame-alist '(alpha . (90 . 98)))

	;; change font size
	(set-face-attribute 'default nil	:height 100)

	;; setup theme
	(load-theme 'catppuccin t)
	(setq catppuccin-flavor 'frappe)
	(catppuccin-reload))

;; modeline
(require 'telephone-line)

(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
			telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
			telephone-line-primary-right-separator 'telephone-line-cubed-right
			telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)

(setq telephone-line-height 24
			telephone-line-evil-use-short-tag t)

(telephone-line-mode 1)
