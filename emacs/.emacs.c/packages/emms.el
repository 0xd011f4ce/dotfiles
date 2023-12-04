;; emms configurations go here
(require 'emms)
(require 'emms-setup)

;; setup emms
(emms-all)
(emms-default-players)

(setq emms-source-file-default-directory "~/Music")
(setq emms-playlist-default-major-mode 'emms-playlist-mode)
(setq emms-info-asynchronously t)

;; setup the browser
(require 'emms-browser)
(setq emms-browser-covers 'emms-browser-cache-thumbnail)
(setq emms-browser-covers-cache-directory
			(expand-file-name "~/.emacs.d/emms/covers"))
(setq emms-browser-info-title-format "${info-artist} - ${info-title}")

;; show thumbnails in the browser
;; (setq emms-browser-covers-browser-function 'emms-browser-cache-thumbnail)
(setq emms-browser-covers 'emms-browser-cache-thumbnail-async)

;; setup the playlist display
(require 'emms-mode-line)
(emms-mode-line 1)

;; open the browser
(global-set-key (kbd "C-c e b") 'emms-smart-browse)

;; make the browser pretty \o/
(setq emms-browser-covers-column 10)
(setq emms-browser-info-column 30)

;; update the browser when adding new music
(add-hook 'emms-browser-insert-hook 'emms-browser-cache-thumbnail)

;; save and restore emms state on exit and start
;; (add-hook 'kill-emacs-hook 'emms-save)
;; (add-hook 'after-init-hook 'emms-load)

(require 'emms-volume)
(setq emms-volume-change-function 'emms-volume-amixer-change) 
