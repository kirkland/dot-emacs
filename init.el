;; if -ergo option is passed, load alternate init file, else regular one

(defvar use-ergo-mode nil)

;; (setq command-switch-alist '(("-ergo" . 
;; 			      (lambda (arg)
;; 				(setq use-ergo-mode 1)
;; 				(load-file "~/.emacs.d/init-ergo.el")))))

(load-file "~/.emacs.d/init-standard.el")

;; (add-hook 'after-init-hook
;;  	  '(lambda ()
;; 	     (if (null use-ergo-mode)
;; 		 (setq call-standard 1)
;; 	       (setq call-ergo 1))))
	  
		 ;; (load-file "~/.emacs.d/init-standard.el")
		 ;; (load-file "~/.emacs.d/init-ergo.el"))))



;(not (null use-ergo-mode))

;(after-init-hook)

(boundp 'call-standard)
(boundp 'call-ergo)

(length command-switch-alist)