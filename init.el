(require 'cl)

;; paths
(defconst emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(mapcar (lambda (dir) (add-to-list 'load-path dir))
	(list
	 emacs-root
	 (concat emacs-root "color-theme-6.6.0")
	 (concat emacs-root "yasnippet-0.6.1c")
	 (concat emacs-root "rails-reloaded") 
	 (concat emacs-root "ruby-mode")
	 (concat emacs-root "rinari")
	 (concat emacs-root "rails-minor-mode")
	 (concat emacs-root "jd-el")
	 (concat emacs-root "vimpulse")
	 ))

(if (eql system-type 'windows-nt) (load-file (concat emacs-root "windows-init.el")))

;; i think this only works because it appears before loading of custom file
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "yellow" :weight light))))
 '(link ((((class color) (background light)) (:foreground "cyan" :underline t))))
 '(minibuffer-prompt ((t (:foreground "cyan" :family "default")))))
;; colors
(require 'color-theme)
(color-theme-initialize)

(global-set-key (kbd "C-c t 1") (lambda () (interactive) (color-theme-arjen)))
(global-set-key (kbd "C-c t 2") (lambda () (interactive) (color-theme-blue-mood)))

(defconst emacs-scratch (concat (getenv "HOME") "/.scratch-emacs/"))
(make-directory emacs-scratch t)

(setq custom-file "~/.emacs.d/auto-custom.el")
(load custom-file)

;; misc options
(and (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(and (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(unless (eql system-type 'darwin)
    (menu-bar-mode -1))
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
(setq tab-width 4)
(setq indent-tabs-mode nil)
(if (eql system-type 'darwin) (set-face-attribute 'default nil :font "Andale Mono"))

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

(require 'bookmark+)

;; rails minor modes
;(require 'rails-autoload)
(require 'rinari)
;(require 'rails)

;; misc functions
(load-file "~/.emacs.d/my_functions.el")

;; my custom keybindings
(load-file "~/.emacs.d/my_bindings.el")

;; ido customization
;; doesn't work, because M-k binding in kirkland mode has precedence
(add-hook 'ido-setup-hook (lambda ()
			    (define-key ido-file-completion-map (kbd "M-k") 'ido-next-match)
			    (define-key ido-file-completion-map (kbd "M-l") 'ido-prev-match)
			    (define-key ido-buffer-completion-map (kbd "M-k") 'ido-next-match)
			    (define-key ido-buffer-completion-map (kbd "M-l") 'ido-prev-match)))

;; makes buffer switching/file opening awesome
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(global-set-key (kbd "C-b") 'ido-switch-buffer)

;; cycle-buffer
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
(global-set-key [(f9)]        'cycle-buffer-backward)
(global-set-key [(f10)]       'cycle-buffer)
(global-set-key [(shift f9)]  'cycle-buffer-backward-permissive)
(global-set-key [(shift f10)] 'cycle-buffer-permissive)

;; javascript
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; prawn, rake syntax hilighting
(add-to-list 'auto-mode-alist '("\\.prawn_dsl$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))

;; shell customizations
(add-hook 'shell-mode-hook (lambda ()
  (define-key shell-mode-map (kbd "M-.") 'comint-insert-previous-argument)
  (define-key shell-mode-map (kbd "C-p") 'comint-previous-input)
  (define-key shell-mode-map (kbd "C-n") 'comint-next-input)))

(if (eql system-type 'darwin)
    (setenv "PATH" "/opt/local/bin:/opt/local/sbin:/Users/rkaufman/.gem/ruby/1.9.1/bin:/Users/rkaufman/.ruby_versions/ruby-1.9.1-p243/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:/Users/rkaufman/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin:/Users/rkaufman/bin"))

;; haml
(require 'haml-mode)

;; sass syntax hilighting
(add-to-list 'auto-mode-alist '("\\.sass$" . haml-mode))

;; use C-c <left> and C-c <right> to cycle through recent window layouts
(winner-mode 1)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;;; run package-list-packages
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

; simulate vi's '.' command
(require 'dot-mode)
(add-hook 'find-file-hooks 'dot-mode-on)

(require 'google-maps)

; vim shit
(require 'vimpulse)
(setq viper-mode t)
(viper-mode)

;(ansi-term "bash")
(shell)

;; start server. then, use emacs-newwindow to connect to it
(if (and (or
          (eq 'windows-nt system-type)
          (featurep 'xemacs))
         (locate-library "gnuserv")
         (locate-file "gnuserv" exec-path '(".exe" "")))
    (progn (require 'gnuserv)
           (gnuserv-start))
  (when (not (eq 'windows-nt system-type)) (server-start)))
