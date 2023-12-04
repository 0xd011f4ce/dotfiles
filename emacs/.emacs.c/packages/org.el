;; org configurations are here
(require 'org)
(require 'org-bullets)

;; Use org-bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Hide delimiters
(setq org-hide-emphasis-markers t)

;; Customize bullet symbols
(setq org-bullets-bullet-list '("☀" "✿" "☽" "■"))

(add-hook 'org-mode-hook
					(lambda ()
						(org-indent-mode)
						(setq org-adapt-indentation nil)
						(setq-local line-spacing 0.2) ; Add spacing between lines if needed
						))

;; Customize faces for different heading levels and increase font size
(custom-set-faces
 '(org-level-1 ((t (:foreground "#268bd2" :weight bold :height 1.2))))
 '(org-level-2 ((t (:foreground "#859900" :weight bold :height 1.1))))
 '(org-level-3 ((t (:foreground "#b58900" :height 1.05))))
 '(org-level-4 ((t (:foreground "#cb4b16"))))
 '(org-level-5 ((t (:foreground "#6c71c4"))))
 '(org-level-6 ((t (:foreground "#2aa198"))))
 '(org-level-7 ((t (:foreground "#268bd2"))))
 '(org-level-8 ((t (:foreground "#859900"))))
 )
