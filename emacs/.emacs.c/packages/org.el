;; org configurations are here
(require 'org)
(require 'org-habit)
(require 'org-bullets)
(require 'ob)
(require 'org-alert)
(require 'org-indent)
(require 'ox-gfm)

(add-to-list 'org-modules 'org-habit)
(setq org-habit-graph-column 60)

(setq org-adapt-indentation nil
			org-ellipsis " ▾"
			org-hide-emphasis-markers t
			org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))

(setq org-agenda-files '("~/Org"))

(setq org-agenda-start-with-log-mode t
			org-agenda-window-setup 'other-tab
			org-log-done 'time
			org-log-into-drawer t)

(setq org-todo-keywords
			'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
				(sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

(setq org-tag-alist '(("@errand" . ?E)
											("@home" . ?H)
											("@work" . ?W)
											("agenda" . ?a)
											("planning" . ?p)
											("publish" . ?P)
											("batch" . ?b)
											("note" . ?n)
											("idea" . ?i)
											("thinking" . ?t)
											("recurring" . ?r)))

(define-key org-mode-map (kbd "C-c <up>") 'org-priority-up)
(define-key org-mode-map (kbd "C-c <down>") 'org-priority-down)

(global-set-key (kbd "C-c C-l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
			'(("t" "Tasks / Projects")
				("tt" "Task" entry (file+olp "~/Org/Tasks.org" "Active")
				 "* TODO %?\n	 %U\n	 %a\n	 %i" :empty-lines 1)
				("ts" "Clocked Entry Subtask" entry (clock)
				 "* TODO %?\n	 %U\n	 %a\n	 %i" :empty-lines 1)
				("td" "Simple TODO" entry (file+olp "~/Org/Tasks.org" "Active")
				 "* TODO %?" :empty-lines 1)

				("c" "Calendar")
				("ct" "Calendar TODO" entry (file+olp "~/Org/Calendar.org" "Calendar")
				 "* TODO %?\nDEADLINE: %^T" :empty-lines 1)
				("cn" "Calendar NEXT" entry (file+olp "~/Org/Calendar.org" "Calendar")
				 "* NEXT %?\nDEADLINE: %^T\n:PROPERTIES:\n:REMINDERN: 30 25 20 15\n:END:" :empty-lines 1)

				("j" "Journal Entries")
				("jj" "Journal" entry
				 (file+olp+datetree "~/Org/Journal.org")
				 "\n* %<%I:%M %p> - Journal:\n\n%?\n\n"

				 :clock-in :clock-resume
				 :empty-lines 1)
				("jm" "Meeting" entry
				 (file+olp+datetree "~/Org/Journal.org")
				 "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
				 :clock-in :clock-resume
				 :empty-lines 1)

				("n" "Notes")
				("nn" "Simple note" entry (file+olp "~/Org/Notes.org" "Notes")
				 "** %?")))

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

(set-face-attribute 'org-table nil	:inherit 'fixed-pitch)
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil		:inherit '(shadow fixed-pitch))
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)

(setq org-agenda-custom-commands
			'(("d" "Dashboard"
				 ((agenda "" ((org-deadline-warning-days 14)))
					(todo "NEXT"
								((org-agenda-overriding-header "Next Tasks")))
					(tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

				("n" "Next Tasks"
				 ((todo "NEXT"
								((org-agenda-overriding-header "Next Tasks")))))


				("W" "Work Tasks" tags-todo "+work")

				;; Low-effort next actions
				("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
				 ((org-agenda-overriding-header "Low Effort Tasks")
					(org-agenda-max-todos 20)
					(org-agenda-files org-agenda-files)))

				("w" "Workflow Status"
				 ((todo "WAIT"
								((org-agenda-overriding-header "Waiting on External")
								 (org-agenda-files org-agenda-files)))
					(todo "REVIEW"
								((org-agenda-overriding-header "In Review")
								 (org-agenda-files org-agenda-files)))
					(todo "PLAN"
								((org-agenda-overriding-header "In Planning")
								 (org-agenda-todo-list-sublevels nil)
								 (org-agenda-files org-agenda-files)))
					(todo "BACKLOG"
								((org-agenda-overriding-header "Project Backlog")
								 (org-agenda-todo-list-sublevels nil)
								 (org-agenda-files org-agenda-files)))
					(todo "READY"
								((org-agenda-overriding-header "Ready for Work")
								 (org-agenda-files org-agenda-files)))
					(todo "ACTIVE"
								((org-agenda-overriding-header "Active Projects")
								 (org-agenda-files org-agenda-files)))
					(todo "COMPLETED"
								((org-agenda-overriding-header "Completed Projects")
								 (org-agenda-files org-agenda-files)))
					(todo "CANC"
								((org-agenda-overriding-header "Cancelled Projects")
								 (org-agenda-files org-agenda-files)))))))

(setq alert-default-style 'libnotify
			org-alert-interval 120
			org-alert-notify-cutoff 10
			org-alert-notify-after-event-cutoff 5)
(org-alert-enable)

;; setup org-babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((C . t)))

(setq org-babel-enable-inline-code t)
(setq org-babel-results-keyword "results")
(setq org-export-with-toc nil)

(define-key org-mode-map (kbd "C-c C-c") 'org-babel-execute-src-block)
