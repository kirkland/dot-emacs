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

;; doesn't work quite right...
(add-hook 'after-make-frame-hook
	  (lambda (x)
	    (if (or (eql nil (getenv "SSH_CLIENT"))
		    (eql emacs-major-version 21)
		    (eql emacs-major-version 22))
		(color-theme-arjen)
	      (if (eq system-type 'gnu/linux)
		  (color-theme-blue-mood)))))
	    
(global-set-key (kbd "C-c t 1") (lambda () (interactive) (color-theme-arjen)))
(global-set-key (kbd "C-c t 2") (lambda () (interactive) (color-theme-blue-mood)))