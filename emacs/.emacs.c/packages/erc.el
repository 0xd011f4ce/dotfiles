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

;; connect to the irc networks when emacs is in server mode
(defun my/connect-to-irc-servers ()
	(interactive)
	(erc-tls :server "irc.suragu.net" :nick "dollface" :port 6697))
