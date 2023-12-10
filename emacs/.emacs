(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("elpa" . "https://elpa.gnu.org/packages/")))

;; TODO: I really should organise this
(setq package-selected-packages
			'(eglot
				projectile
				treemacs
				treemacs-projectile
				flycheck
				company
				yasnippet
				yasnippet-snippets
				which-key
				emmet-mode
				prettier
				magit
				multiple-cursors
				helm
				helpful

				try

				org-bullets

				all-the-icons
				treemacs-all-the-icons
				rainbow-delimiters
				rainbow-mode
				telephone-line
				dashboard
				dracula-theme))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
	(package-refresh-contents)
	(mapc #'package-install package-selected-packages))

;;; ==== Packages ====

;; which-key
(setq which-key-show-early-on-C-h t)
(which-key-mode)

;; flycheck
(eval-after-load 'flycheck
	'(flycheck-add-mode 'proselint 'text-mode))
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; company
(setq company-idle-delay 0.1
			company-minimum-prefix-length 1
			company-tooltip-limit 10
			company-tooltip-align-annotations t
			company-echo-delay 0
			company-tooltip-flip-when-above t)
(add-hook 'after-init-hook 'global-company-mode)

;; yasnippet
(yas-global-mode 1)
(global-set-key (kbd "C-c y") 'yas-expand)
(define-key yas-minor-mode-map (kbd "C-c l") 'yas-describe-tables)

;; helm
(helm-mode)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;; treemacs
(global-set-key (kbd "<f8>") 'treemacs)

;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; prettier
(global-set-key (kbd "C-c i") 'prettier-prettify)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c m") 'mc/mark-all-in-region)
(define-key mc/keymap (kbd "<return>") nil) ;; this causes me issues with emmet

;; ispell
(global-set-key (kbd "C-c s") 'ispell-word)
(global-set-key (kbd "C-c f") 'ispell-buffer)

;; helpful
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;;; ==== Languages ====

;; HTML/CSS
(add-hook 'sgml-mode-hook 'emmet-mode)

;; ===== Custom ====
(setq gc-cons-threshold (* 100 1024 1024))

(defun my/load-if-exists (file)
	(interactive)
	(if (file-exists-p file)
			(load file)
		(message "File does not exist: %s" file)))

;; load configuration for packages
(my/load-if-exists "~/.emacs.c/packages/org.el") ;; org-mode configurations
(my/load-if-exists "~/.emacs.c/packages/dashboard.el") ;; dashboard configs
(my/load-if-exists "~/.emacs.c/packages/erc.el") ;; erc config
(my/load-if-exists "~/.emacs.c/packages/eglot.el") ;; eglot configs

;; ;; the folder is called ".emacs.c" (the c stands for custom im so smort)
(my/load-if-exists "~/.emacs.c/appearance.el") ;; all configurations regarding appearance
(my/load-if-exists "~/.emacs.c/better-defaults.el") ;; better-defaults
(my/load-if-exists "~/.emacs.c/utils.el") ;; some useful things
