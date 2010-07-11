;; these bindings are redundant, or I want to force myself to not use them
;; (global-unset-key (kbd "M-."))
;; (global-unset-key (kbd "M-,"))
;; (global-unset-key (kbd "M-4"))
;; (global-unset-key (kbd "M-5"))
;; (global-unset-key (kbd "M-6"))
;; (global-unset-key (kbd "M-7"))
;; (global-unset-key (kbd "M-8"))
;; (global-unset-key (kbd "M-q"))
;; (global-unset-key (kbd "M-'"))
;; (global-unset-key (kbd "M-m"))
;; (global-unset-key (kbd "M-n"))
(global-unset-key (kbd "s-h"))

;; misc global bindings
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-x C-n") 'bs-show) ; fat fingers
(global-set-key (kbd "C-x C-v") 'bs-show) ; fatter fingers
(global-set-key (kbd "C-e") 'eval-last-sexp)
(global-set-key (kbd "C-q") 'shell)
(global-set-key (kbd "C-c y") 'clipboard-yank)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-c 9") 'comment-region)
(global-set-key (kbd "C-c 0") 'uncomment-region)

;; basic movement and editing 
;; (global-set-key (kbd "M-j") 'backward-char)
;; (global-set-key (kbd "M-;") 'forward-char)
;; (global-set-key (kbd "M-k") 'next-line)
;; (global-set-key (kbd "M-l") 'previous-line)
;; (global-set-key (kbd "M-d") 'delete-backward-char)
;; (global-set-key (kbd "M-J") 'delete-backward-char)
;; (global-set-key (kbd "M-f") 'delete-char)
;; (global-set-key (kbd "M-:") 'delete-char)

;; (global-set-key (kbd "M-u") 'backward-word)
;; (global-set-key (kbd "M-i") 'forward-word)
;; (global-set-key (kbd "M-e") 'backward-kill-word)
;; (global-set-key (kbd "M-U") 'backward-kill-word)
;; (global-set-key (kbd "M-r") 'kill-word)
;; (global-set-key (kbd "M-I") 'kill-word)

;; (global-set-key (kbd "M-o") 'move-beginning-of-line)
;; (global-set-key (kbd "M-p") 'move-end-of-line)
;; (global-set-key (kbd "M-t") 'kill-line)

;; (global-set-key (kbd "M-n") 'beginning-of-buffer)
;; (global-set-key (kbd "M-m") 'end-of-buffer)

;; killing, yanking
;; (global-set-key (kbd "M-v") 'yank)
;; (global-set-key (kbd "M-b") 'yank-pop)
;; (global-set-key (kbd "M-c") 'kill-ring-save)
;; (global-set-key (kbd "M-SPC") 'set-mark-command)
;; (global-set-key (kbd "M-RET") 'newline)
;; (global-set-key (kbd "M-x") 'kill-region)
;; (global-set-key (kbd "M-4") 'expand-region-linewise)

;; windows and buffers
(global-set-key (kbd "M-s") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "C-c 1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
;; (global-set-key (kbd "C-c v") 'split-window-vertically)
;; (global-set-key (kbd "C-c h") 'split-window-horizontally)
(global-set-key (kbd "C-k") 'kill-buffer)
(global-set-key (kbd "<XF86Back>") 'cycle-buffer-backward)
(global-set-key (kbd "<XF86Forward>") 'cycle-buffer)
(global-set-key (kbd "M-&") 'cycle-buffer-backward)
(global-set-key (kbd "M-*") 'cycle-buffer)
(global-set-key (kbd "M-7") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-8") 'other-window)

;; search
;; (global-set-key (kbd "C-f") 'isearch-forward)
;; (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
;; (global-set-key (kbd "C-S-f") 'isearch-backward)
;; (define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)

;; misc
;; (global-set-key (kbd "M-/") 'undo)
(global-set-key (kbd "M-h") 'dabbrev-expand)
(global-set-key (kbd "M-a") 'execute-extended-command)
(global-set-key (kbd "M-9") 'copy-current-line)
(global-set-key (kbd "C-<f5>") 'revert-buffer)
(global-set-key (kbd "s-r") 'revert-buffer)
(global-set-key (kbd "s-g") 'keyboard-quit)

;; org-mode unbindings
(add-hook 'org-mode-hook (lambda ()
			   (define-key org-mode-map (kbd "M-a") nil)
			   (define-key org-mode-map (kbd "M-e") nil)
			   (define-key org-mode-map (kbd "C-k") nil)))

;; shell mode unbindings
(add-hook 'shell-mode-hook (lambda ()
			(define-key shell-mode-map (kbd "M-p") nil)
			(define-key shell-mode-map (kbd "M-s") nil)
			(define-key shell-mode-map (kbd "M-n") nil)))

;; dired mode unbindings
(add-hook 'dired-mode-hook (lambda ()
			     (define-key dired-mode-map (kbd "M-s") nil)))
