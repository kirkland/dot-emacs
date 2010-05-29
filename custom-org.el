(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(unless (eql system-type 'darwin) (setq org-tag-alist '(("comp" . ?c) ("home" . ?h) ("wait" . ?w) ("errand" . ?e) ("call" . ?a) ("today" . ?t) ("tomorrow" . ?r) ("low" . ?l))))

(add-hook 'org-mode-hook
	  '(lambda () (local-set-key "\C-c\r" 'org-insert-todo-heading)
	              (local-set-key (kbd "C-c C-l") 'org-metaright)
		      (local-set-key (kbd "C-c >") 'org-cycle-agenda-files)
		      (local-set-key (kbd "C-c C-j") 'org-shiftmetadown)
		      (local-set-key (kbd "C-c C-k") 'org-shiftmetaup)
		      (local-set-key (kbd "C-c C-s") 'org-sparse-tree)
		      (add-hook 'org-after-todo-state-change-hook ; default tag
				'(lambda () (if (string= "TODO" state)
						(org-toggle-tag "comp" 'on)
					      nil)))
		      (defun org-insert-todo-heading (arg)
			(interactive "P")
			(org-insert-heading)
			(org-todo)
			(insert " "))))

;; doesn't show just DONE items
(setq org-agenda-custom-commands
      '(("f" tags-tree "comp")))

;(setq (org-agenda-files (quote ("~/life/fun.org" "~/life/work.org" "~/life/personal.org" "~/life/emacs.org" "~/life/investing.org" "~/life/thai.org" "~/life/ruby.org"))))
