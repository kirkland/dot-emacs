;; ideally, no switch would be needed to get the 'standard' configuration
;; but I can't figure out how to do that.

(setq command-switch-alist '(("-ergo" . 
			      (lambda (arg)
				(load-file "~/.emacs.d/init-ergo.el")))
			     ("-standard" . 
			      (lambda (arg)
				(load-file "~/.emacs.d/init-standard.el")))))
