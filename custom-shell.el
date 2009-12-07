(add-hook 'shell-mode-hook
	  '(lambda () (local-set-key "\M-." 'comint-insert-previous-argument)))