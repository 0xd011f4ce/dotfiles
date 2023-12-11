;; lsp-bridge configs go here
(add-to-list 'load-path "~/.emacs.c/external/lsp-bridge")

(require 'lsp-bridge)
(global-lsp-bridge-mode)
;; (add-hook 'prog-mode-hook 'lsp-bridge-mode)
