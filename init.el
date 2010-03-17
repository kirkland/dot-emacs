;; if -ergo option is passed, load alternate init file, else regular one

;(defvar use-ergo-mode nil)

;(setq command-switch-alist '(("-ergo" . 
;  (lambda (arg)
;    (setq use-ergo-mode 1)))))

(if (null 'use-ergo-mode)
    (load-file "~/.emacs.d/init-standard.el")
    (load-file "~/.emacs.d/init-ergo.el"))
