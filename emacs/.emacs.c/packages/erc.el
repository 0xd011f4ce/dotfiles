;; erc configurations go here
(require 'erc)

;; ;; define ERC networks
(setq erc-networks-alist
			'(("irc.suragu.net"
				 :nick "dollface"
				 :password ""
				 :port 6697)))

;; ;; notifications
(add-hook 'erc-mode-hook #'erc-notifications-mode)
;; (erc-notifications-mode)
