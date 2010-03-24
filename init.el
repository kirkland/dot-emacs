;; misc options
(tool-bar-mode -1)
(scroll-bar-mode 0)
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq enable-recursive-minibuffers t)
(setq column-number-mode t)
(setq find-file-visit-truename t)
(ansi-color-for-comint-mode-on) ; ?
(show-paren-mode)
(setq blink-matching-delay 0.5) ; ?
(global-font-lock-mode 1) ; aka syntax highlighting
(transient-mark-mode 1) ; active region is highlighted
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq bookmark-save-flag 1) ; save bookmarks immediately
(setq bookmark-default-file "/scratch/rob/emacs/bookmarks.bmk")
(global-set-key (kbd "\C-x\C-b") 'bs-show) ; use buffer-selection-menu mode
(global-set-key "\C-z" 'shell)
(setq scroll-conservatively 10000) ; scroll one line at a time
(add-to-list 'load-path ".emacs.d")
;; colors
(add-to-list 'load-path ".emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(if (eql nil (getenv "SSH_CLIENT"))
    (color-theme-arjen)
    (color-theme-blue-mood))

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
        "Prevent annoying \"Active processes exist\" query when you quit Emacs."
        (flet ((process-list ())) ad-do-it))

;; global shortcuts
(global-set-key (kbd "C-c y") 'clipboard-yank)

;; shell: M-. acts 'normal'
;(define-key shell-mode-map "\M-." 'comint-insert-previous-argument)

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "/scratch/" (user-login-name) "/emacs_autosaves/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/scratch/" (user-login-name) "/emacs_backups/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

(setq auto-save-list-file-prefix
  (concat "/scratch/" (user-login-name) "/emacs_auto-save-list/.saves-"))

;; org mode customizations
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-tag-alist '(("comp" . ?c) ("home" . ?h) ("wait" . ?w) ("errand" . ?e) ("call" . ?a) ("today" . ?t) ("tomorrow" . ?r) ("work" . ?k) ("low" . ?l)))

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

;; new global keys
(load-file "/home/rob/.emacs.d/global-keys.el")

(shell)
