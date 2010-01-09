; (add-hook 'shell-mode-hook
; 	  '(lambda () (local-set-key "\M-." 'comint-insert-previous-argument)))

(define-key shell-mode-map "\M-." 'comint-insert-previous-argument)