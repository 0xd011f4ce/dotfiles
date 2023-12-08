;; erc configs go here
(require 'erc)

(add-hook 'erc-mode
					(lambda ()
						(interactive)
						(erc-track-mode t)
						(setq erc-keywords '("dollface"))
						(erc-notifications-mode t)))
