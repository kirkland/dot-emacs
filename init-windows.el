(defvar emacs-scratch "/scratch/rkaufman/emacs/")
(add-hook 'comint-output-filter-functions
	  'shell-strip-ctrl-m nil t)
(add-hook 'comint-output-filter-functions
	  'comint-watch-for-password-prompt nil t)
(setq shell-file-name "bash")