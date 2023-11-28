(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
												 ("org" . "https://orgmode.org/elpa/")
												 ("elpa" . "https://elpa.gnu.org/packages/")))
(setq package-selected-packages
			'(lsp-mode
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

				org-bullets
				visual-fill-column

				all-the-icons
				all-the-icons-dired
				treemacs-all-the-icons
				gruvbox-theme))

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

;; org-mode
(require 'org-bullets)
(add-hook 'org-mode-hook
					(lambda ()
						(dolist (face '((org-level-1 . 1.2)
														(org-level-2 . 1.1)
														(org-level-3 . 1.05)
														(org-level-4 . 1.0)
														(org-level-5 . 1.1)
														(org-level-6 . 1.1)
														(org-level-7 . 1.1)
														(org-level-8 . 1.1)))
							(set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

						(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
						(set-face-attribute 'org-code nil		:inherit '(shadow fixed-pitch))
						(set-face-attribute 'org-table nil	 :inherit '(shadow fixed-pitch))
						(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
						(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
						(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
						(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

						(font-lock-add-keywords 'org-mode
																		'(("^ *\\([-]\\) "
																			 (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

						(setq org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")
									org-ellipsis " ▾")

						(setq visual-fill-column-width 100
									visual-fill-column-center-mode t)

						(org-indent-mode)
						(org-bullets-mode 1)
						(visual-line-mode 1)
						(variable-pitch-mode 1)
						(visual-fill-column-mode 1)))

;;; ==== Languages ====
;; LSP
(add-hook 'js-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
			read-process-output-max (* 1024 1024)
			company-idle-delay 0.0
			company-minimum-prefix-length 1)

(with-eval-after-load 'lsp-mode
	(require 'dap-chrome)
	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
	(yas-global-mode))

;; HTML/CSS
(add-hook 'sgml-mode-hook 'emmet-mode)

;;; ==== Emacs behaviour/appeareance ====
(setq auto-save-default nil
			create-lockfiles nil
			inhibit-startup-screen t)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

;; use only tabs and convert spaces to tabs
(add-hook 'prog-mode-hook
					(lambda ()
						(setq indent-tabs-mode t
									tab-width 2
									c-basic-offset 2
									python-indent-offset 2)))

(add-hook 'before-save-hook
					(lambda ()
						(tabify (point-min) (point-max))))

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
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; all the icons
(when (display-graphic-p)
	(require 'all-the-icons)
	(require 'all-the-icons-dired)
	(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
	(require 'treemacs-all-the-icons)
	(treemacs-load-theme "all-the-icons"))

;; gruvbox theme
(load-theme 'gruvbox-dark-soft t)
