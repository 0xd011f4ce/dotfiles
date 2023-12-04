;; erc configurations go here
(require 'erc)

;; define ERC networks
(setq erc-networks-alist
			'(("irc.suragu.net"
				 :nick "dollface"
				 :password ""
				 :port 6697)))

;; notifications
(erc-notifications-mode)

;; autocomplete
(require 'erc-track)
(erc-track-mode t)

;; other cool stuff
(require 'erc-ring)
(erc-ring-mode t)
