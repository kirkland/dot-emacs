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
;(menu-bar-mode -1)

;; Load Paths
;; ==========

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/emacs-rails-reloaded")
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
;(load-library "icicles")  ; slows startup
(load-file "~/.emacs.d/backups.el")

(require 'rails-autoload)

;; Emacs automatic settings
;; ========================

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 97 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "yellow" :weight light))))
 '(link ((((class color) (background light)) (:foreground "cyan" :underline t))))
 '(minibuffer-prompt ((t (:foreground "cyan" :family "default")))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(org-agenda-files (quote ("~/notes/fun.org" "~/notes/work.org" "~/notes/personal.org" )))
 '(scroll-conservatively 10000)
 '(show-paren-mode t))


(shell)

;; below here should be organized more nicely at some point

(require 'color-theme)
(color-theme-initialize)

(if (eql nil (getenv "SSH_CLIENT"))
    (color-theme-arjen)
    (color-theme-blue-mood))

