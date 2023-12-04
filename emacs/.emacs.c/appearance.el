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
	(require 'all-the-icons-dired)
	(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
	(require 'treemacs-all-the-icons)
	(treemacs-load-theme "all-the-icons"))

;; highlight indent guides
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; change font size
(set-face-attribute 'default nil :height 100)

;; gruvbox theme
(load-theme 'gruvbox-dark-soft t)
