;; org configurations are here
(require 'org)
(require 'org-bullets)

(setq org-adapt-indentation nil
			org-ellipsis " ▾"
			org-hide-emphasis-markers t
			org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))

(add-hook 'org-mode-hook
					(lambda ()
						(org-indent-mode)
						(visual-line-mode 1)
						(org-bullets-mode 1)
						(setq-local line-spacing 0.2)))

(dolist (face '((org-level-1 . 1.2)
								(org-level-2 . 1.1)
								(org-level-3 . 1.05)
								(org-level-4 . 1.0)
								(org-level-5 . 1.1)
								(org-level-6 . 1.1)
								(org-level-7 . 1.1)
								(org-level-8 . 1.1)))
	(set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; replace list hyphen with dot
(font-lock-add-keywords 'org-mode
												'(("^ *\\([-]\\) "
													 (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(require 'org-indent)

(set-face-attribute 'org-table nil	:inherit 'fixed-pitch)
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil		:inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
