;; convert spaces to tabs before saving
(add-hook 'before-save-hook
					(lambda ()
						(when (not (eq major-mode 'org-mode))
							(tabify (point-min) (point-max)))))
