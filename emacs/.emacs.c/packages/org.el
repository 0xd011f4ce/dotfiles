;; org configurations are here
(require 'org-bullets)
(add-hook 'org-mode-hook
					(lambda ()
						(dolist (face '((org-level-1 . 1.2)
														(org-level-2 . 1.1)
														(org-level-3 . 1.05)
														(org-level-4 . 1.0)
														(org-level-5 . 1.1)
														(org-level-6 . 1.1)
														(org-level-7 . 1.1)
														(org-level-8 . 1.1)))
							(set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

						(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
						(set-face-attribute 'org-code nil		:inherit '(shadow fixed-pitch))
						(set-face-attribute 'org-table nil	 :inherit '(shadow fixed-pitch))
						(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
						(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
						(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
						(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

						(font-lock-add-keywords 'org-mode
																		'(("^ *\\([-]\\) "
																			 (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

						(setq org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")
									org-ellipsis " ▾")

						(setq visual-fill-column-width 100
									visual-fill-column-center-mode t)

						(org-indent-mode)
						(org-bullets-mode 1)
						(visual-line-mode 1)
						(variable-pitch-mode 1)
						(visual-fill-column-mode 1)))
