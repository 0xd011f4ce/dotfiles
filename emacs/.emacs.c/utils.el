;; convert spaces to tabs before saving
(add-hook 'before-save-hook
					(lambda ()
						(when (not (eq major-mode 'org-mode))
							(tabify (point-min) (point-max)))))

;; use only tabs, enable electric pair, rainbow delimiters and rainbow mode
(add-hook 'prog-mode-hook
					(lambda ()
						(setq indent-tabs-mode t
									tab-width 2
									c-basic-offset 2
									python-indent-offset 2)
						(electric-pair-mode)
						(rainbow-delimiters-mode)
						(rainbow-mode)))

;; enable tab-bar
(tab-bar-mode t)

;; enable auto fill
(auto-fill-mode)
