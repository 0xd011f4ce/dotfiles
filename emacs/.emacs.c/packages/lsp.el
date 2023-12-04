;; lsp configurations are here
(setq read-process-output-max (* 1024 1024)
			company-idle-delay 0.0
			company-minimum-prefix-length 1)

(with-eval-after-load 'lsp-mode
	(require 'dap-chrome)
	(require 'company)
	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
	(add-to-list 'company-backends 'company-files)
	(yas-global-mode))

;; add hooks
(add-hook 'c-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'sgml-mode-hook 'lsp)
(add-hook 'css-mode-hook 'lsp)
(add-hook 'js-mode-hook 'lsp)
