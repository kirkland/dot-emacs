

;; General Options
;; ===============

(setq enable-recursive-minibuffers t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq find-file-visit-truename t)
(ansi-color-for-comint-mode-on)
(show-paren-mode)
(setq blink-matching-delay 0.5)
(setq inhibit-startup-message t)
(global-font-lock-mode 1)
(transient-mark-mode 1)
(put 'erase-buffer 'disabled nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)

;; Load Paths
;; ==========

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/icicles")
;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
(add-to-list 'load-path "~/.emacs.d/ruby-mode")
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")


;; Various Modules/Cusomizations
;; =============================

(load-file "~/.emacs.d/custom-org.el")
(load-file "~/.emacs.d/custom-global.el")
;(load-file "~/.emacs.d/custom-slime.el")
(load-file "~/.emacs.d/custom-ruby.el")
(load-file "~/.emacs.d/snippet.el")
(load-file "~/.emacs.d/find-recursive.txt")
(load-library "icicles")
(load-file "~/.emacs.d/backups.el")
(setq custom-file "~/.emacs.d/auto-custom.el")
(load "~/.emacs.d/haskell-mode/haskell-site-file")
(load custom-file 'noerror)

(require 'uniquify)
(icy-mode)


;; below here should be organized more nicely at some point, or not

(require 'color-theme)
(color-theme-initialize)

(if (eql nil (getenv "SSH_CLIENT"))
    (color-theme-arjen)
    (color-theme-blue-mood))

(put 'dired-find-alternate-file 'disabled nil)

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
        "Prevent annoying \"Active processes exist\" query when you quit Emacs."
        (flet ((process-list ())) ad-do-it))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(shell)
(load-file "~/.emacs.d/custom-shell.el")

(switch-to-buffer (other-buffer)) ; lazy way to start in *scratch*, not shell

;; fix tabs?!
(define-key text-mode-map (kbd "TAB") 'self-insert-command)

;; html helper mode
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;; org mode
(global-set-key "\C-ca" 'org-agenda)

;; bookmarks
(setq bookmark-save-flag 1) ; save bookmarks immediately
(setq bookmark-default-file "/scratch/rob/emacs/bookmarks.bmk")

;; HYPER KEY
(setq w32-pass-apps-to-system nil w32-apps-modifier 'hyper) ;; Menu key
(global-set-key (kbd "H-p") 'previous-line)

;; TODO: C-c s switches to scratch buffers

;; vim movements
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-k") 'previous-line)

(global-set-key (kbd "C-c f") 'find-file-at-point)

;; new rails minor mode
(add-to-list 'load-path (expand-file-name "~/.emacs.d/rails-minor-mode"))
(require 'rails)
