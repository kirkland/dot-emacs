(require 'cl)

;; paths
(defconst emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(mapcar (lambda (dir) (add-to-list 'load-path dir))
	(list
	 emacs-root
	 (concat emacs-root "color-theme-6.6.0")
	 (concat emacs-root "yasnippet-0.6.1c")
	 ))

;; platform dependent
(if (eql system-type 'gnu/linux)
    (load-file (concat emacs-root "init-linux.el"))
  (load-file (concat emacs-root "init-windows.el")))

(defconst emacs-scratch (concat (getenv "HOME") "/.scratch-emacs/"))
(make-directory emacs-scratch t)

(setq custom-file "~/.emacs.d/auto-custom.el")
(load custom-file)

;; misc options
(and (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(and (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(menu-bar-mode -1)
(setq inhibit-startup-message t)
(setq enable-recursive-minibuffers t)
(setq column-number-mode t)
(setq find-file-visit-truename t)
(ansi-color-for-comint-mode-on) ; ?
(show-paren-mode 1)
(setq blink-matching-delay 0.5) ; ?
(global-font-lock-mode 1) ; aka syntax highlighting
(transient-mark-mode 1) ; active region is highlighted
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq bookmark-save-flag 1) ; save bookmarks immediately
(setq bookmark-default-file (concat emacs-scratch "bookmarks.bmk"))
(setq scroll-conservatively 10000) ; scroll one line at a time

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
        "Prevent annoying \"Active processes exist\" query when you quit Emacs."
        (flet ((process-list ())) ad-do-it))

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat emacs-scratch "autosaves/"))

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
(defvar backup-dir (concat emacs-scratch "backups/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

(setq auto-save-list-file-prefix
  (concat emacs-scratch "auto-save-list/.saves-"))

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

;; yasnippet
(unless (eq emacs-major-version 21)
  (require 'yasnippet)
  (yas/initialize)
  (yas/load-directory "~/.emacs.d/yasnippet-0.6.1c/snippets")
  (setq yas/root-directory "~/.emacs.d/mysnippets")
  (yas/load-directory yas/root-directory))

(require 'zoom-frm)
(global-set-key (kbd "C-=") 'zoom-in)
(global-set-key (kbd "C--") 'zoom-out)

;; new global keys
(load-file "~/.emacs.d/kirkland-mode.el")

;; misc global bindings
(global-set-key (kbd "C-x C-b") 'bs-show) ; use buffer-selection-menu mode
(global-set-key (kbd "C-e") 'eval-last-sexp)
(global-set-key (kbd "<f5>") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-c y") 'clipboard-yank)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-b") 'switch-to-buffer)
(global-set-key (kbd "C-k") 'kill-this-buffer)
(global-set-key (kbd "C-c 9") 'comment-region)
(global-set-key (kbd "C-c 0") 'uncomment-region)
;(define-key kirkland-minor-mode-map (kbd "C-n") 'bs-show) ; still need something good for this

;; shell customizations
(add-hook 'shell-mode-hook (lambda ()
  (define-key shell-mode-map (kbd "M-.") 'comint-insert-previous-argument)
  (define-key shell-mode-map (kbd "C-p") 'comint-previous-input)
  (define-key shell-mode-map (kbd "C-n") 'comint-next-input)))

(shell)