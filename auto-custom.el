;; Emacs automatic settings
;; ========================

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "yellow" :weight light))))
 '(link ((((class color) (background light)) (:foreground "cyan" :underline t))))
 '(minibuffer-prompt ((t (:foreground "cyan" :family "default")))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(org-agenda-files (quote ("~/notes/fun.org" "~/notes/work.org" "~/notes/personal.org")))
 '(org-enforce-todo-dependencies t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(scroll-conservatively 10000)
 '(show-paren-mode t))

