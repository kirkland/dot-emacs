(setq viper-inhibit-startup-message 't)
(setq viper-expert-level '5)

(define-key viper-vi-global-user-map (kbd "C-b") 'ido-switch-buffer)
(define-key viper-vi-global-user-map (kbd "C-o") 'find-file)
