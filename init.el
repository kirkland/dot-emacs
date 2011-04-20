(defconst emacs-root (concat (getenv "HOME") "/.emacs.d/"))

(defconst emacs-scratch (concat (getenv "HOME") "/.scratch-emacs/"))
(make-directory emacs-scratch t)

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


;; run extra initialization. for some reason, when starting in daemon mode
;; on OSX, it can't find the font i want
(if (eql system-type 'darwin)
    (global-set-key [f12] (lambda ()
			    (interactive)
			    (set-face-attribute 'default nil :font "Andale Mono"))))
		

;; misc global bindings
(global-set-key (kbd "M-a") 'execute-extended-command)
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)

;; window/apple key bindings... probably want to avoid these
(global-set-key (kbd "s-b") 'switch-to-buffer)

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

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-lethe)