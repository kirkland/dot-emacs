;; Emacs automatic settings
;; ========================

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(org-agenda-files (quote ("~/life/fun.org" "~/life/work.org" "~/life/personal.org" "~/life/emacs.org" "~/life/investing.org" "~/life/thai.org" "~/life/ruby.org")))
 '(org-enforce-todo-dependencies t)
 '(org-modules (quote (org-bbdb org-bibtex org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-track)))
 '(scroll-conservatively 10000)
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uzniquify)))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "yellow" :weight light))))
 '(link ((((class color) (background light)) (:foreground "cyan" :underline t))))
 '(minibuffer-prompt ((t (:foreground "cyan" :family "default")))))
