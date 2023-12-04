(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("elpa" . "https://elpa.gnu.org/packages/")))

;; TODO: I really should organise this
(setq package-selected-packages
			'(lsp-mode
				lsp-ui
				lsp-treemacs
				projectile
				hydra
				flycheck
				company
				which-key
				helm-xref
				json-mode
				emmet-mode
				prettier
				magit
				multiple-cursors

				try

				org-bullets

				all-the-icons
				all-the-icons-dired
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

;; helm
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;; treemacs
(global-set-key (kbd "<f8>") 'treemacs)

;; which-key
(which-key-mode)

;; prettier
(add-hook 'after-init-hook #'global-prettier-mode)

;; multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-c m") 'mc/mark-all-like-this)
(define-key mc/keymap (kbd "<return>") nil) ;; this causes me issues with emmet

;; ispell
(global-set-key (kbd "C-c s") 'ispell-word)
(global-set-key (kbd "C-c f") 'ispell-buffer)

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
(my/load-if-exists "~/.emacs.c/packages/lsp.el") ;; lsp-mode configurations
(my/load-if-exists "~/.emacs.c/packages/dashboard.el") ;; dashboard configs

;; ;; the folder is called ".emacs.c" (the c stands for custom im so smort)
(my/load-if-exists "~/.emacs.c/appearance.el") ;; all configurations regarding appearance
(my/load-if-exists "~/.emacs.c/better-defaults.el") ;; better-defaults
(my/load-if-exists "~/.emacs.c/utils.el") ;; some useful things
