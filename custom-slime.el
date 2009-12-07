(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(slime-setup '(slime-fancy))  ; some website said this would fix the swank-loader.lisp problem... shit breaks without it for some reason
(set (make-local-variable 'lisp-indent-function)
     'common-lisp-indent-function)

;; make if indent correctly 
(put 'if 'lisp-indent-function nil)
(put 'with-open-file 'lisp-indent-function nil)
