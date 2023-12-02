;; lsp configurations are here
(setq gc-cons-threshold (* 100 1024 1024)
			read-process-output-max (* 1024 1024)
			company-idle-delay 0.0
			company-minimum-prefix-length 1)

(require 'lsp-ui)
(setq lsp-ui-doc-enable t
			lsp-ui-doc-use-childframe t
			lsp-ui-doc-position 'top
			lsp-ui-doc-include-signature t
			lsp-ui-sideline-enable t
			lsp-ui-sideline-show-diagnostics t
			lsp-ui-sideline-show-hover t
			lsp-ui-sideline-show-code-actions t
			lsp-ui-sideline-code-actions-prefix ""
			lsp-ui-sideline-update-mode 'point)

(global-set-key (kbd "M-RET") 'lsp-ui-sideline-apply-code-actions)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(custom-set-faces
 '(lsp-ui-doc-background ((t (:background "black"))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic))))))

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
