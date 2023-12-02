(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("elpa" . "https://elpa.gnu.org/packages/")))

(setq package-selected-packages
			'(lsp-mode
				lsp-ui
				yasnippet
				yasnippet-snippets
				lsp-treemacs
				projectile
				hydra
				flycheck
				company
				avy
				which-key
				helm-xref
				dap-mode
				json-mode
				emmet-mode
				prettier
				magit
				multiple-cursors

				org-bullets
				visual-fill-column

				all-the-icons
				all-the-icons-dired
				treemacs-all-the-icons
				gruvbox-theme
				rainbow-delimiters
				rainbow-mode
				mood-line
				dimmer
				highlight-indent-guides))

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

;; yasnippet
(global-set-key (kbd "C-c C-y") 'yas-expand)

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
;; load configuration for packages
(load "~/.emacs.c/packages/org.el") ;; org-mode configurations
(load "~/.emacs.c/packages/lsp.el") ;; lsp-mode configurations

;; the folder is called ".emacs.c" (the c stands for custom im so smort)
(load "~/.emacs.c/appearance.el") ;; all configurations regarding appearance
(load "~/.emacs.c/better-defaults.el") ;; better-defaults
(load "~/.emacs.c/utils.el") ;; some useful things
