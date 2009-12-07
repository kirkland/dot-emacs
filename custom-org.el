;; C-c Return makes new todo
(add-hook 'org-mode-hook
	  '(lambda () (local-set-key "\C-c\r" 'org-insert-todo-heading)))

;; add a star to a heading
(add-hook 'org-mode-hook
	  '(lambda () (local-set-key (kbd "C-c C-l") 'org-metaright)))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-tag-alist '(("comp" . ?c) ("home" . ?h) ("wait" . ?w) ("errand" . ?e) ("call" . ?a) ("today" . ?t) ("tomorrow" . ?r) ("work" . ?k)))
;(setq org-log-done 'time) ; timestamp on todo-done

;; C-, doesn't work, so we gotta use something else
(add-hook 'org-mode-hook
	  '(lambda () (local-set-key (kbd "C-c >") 'org-cycle-agenda-files)))

;; move items up and down a list
(add-hook 'org-mode-hook
	  '(lambda () (local-set-key (kbd "C-c C-j") 'org-shiftmetadown)))
(add-hook 'org-mode-hook
	  '(lambda () (local-set-key (kbd "C-c C-k") 'org-shiftmetaup)))