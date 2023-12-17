;; convert spaces to tabs before saving
(add-hook 'before-save-hook
					(lambda ()
						(when (eq major-mode 'prog-mode)
							(tabify (point-min) (point-max)))))

;; use only tabs, enable electric pair, rainbow delimiters and rainbow mode
(add-hook 'prog-mode-hook
					(lambda ()
						(setq indent-tabs-mode t
									tab-width 2
									c-basic-offset 2
									python-indent-offset 2)
						(electric-pair-mode)
						(electric-indent-mode)
						(rainbow-delimiters-mode)
						(rainbow-mode)))

;; enable tab-bar
(tab-bar-mode t)

;; enable auto fill
(auto-fill-mode)

;; indent after <RET>
(global-set-key (kbd "<RET>") 'newline-and-indent)

;; auto update the LAST_MODIFIED field in org
(defun my/org-update-last-modified ()
	(interactive)
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward "^#\\+LAST_MODIFIED:" nil t)
        (progn
          (beginning-of-line)
          (kill-line)
          (insert (format-time-string "#+LAST_MODIFIED: %Y-%m-%d %a %H:%M:%S")))
      (insert (format-time-string "#+LAST_MODIFIED: %Y-%m-%d %a %H:%M:%S")))))

(add-hook 'before-save-hook
					(lambda ()
						(when (eq major-mode 'org-mode)
							(my/org-update-last-modified))))
