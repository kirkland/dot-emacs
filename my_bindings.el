;; these bindings are redundant, or I want to force myself to not use them
(global-unset-key (kbd "M-d"))
(global-unset-key (kbd "M-e"))
(global-unset-key (kbd "M-f"))
(global-unset-key (kbd "M-w"))
(global-unset-key (kbd "M-."))
(global-unset-key (kbd "M-,"))
(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "M-4"))
(global-unset-key (kbd "M-5"))
(global-unset-key (kbd "M-6"))
(global-unset-key (kbd "M-7"))
(global-unset-key (kbd "M-8"))
(global-unset-key (kbd "M-9"))

;; misc global bindings
(global-set-key (kbd "C-x C-b") 'bs-show) ; use buffer-selection-menu mode
(global-set-key (kbd "C-e") 'eval-last-sexp)
(global-set-key (kbd "<f9>") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-z") '(lambda () (interactive) (ansi-term "bash")))
(global-set-key (kbd "C-c y") 'clipboard-yank)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-c 9") 'comment-region)
(global-set-key (kbd "C-c 0") 'uncomment-region)
(global-set-key (kbd "M-g") 'keyboard-quit)
(global-set-key (kbd "C-r") 'toggle-read-only)

;; basic movement and editing 
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-;") 'forward-char)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-l") 'previous-line)
(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-f") 'delete-char)

(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-i") 'forward-word)
(global-set-key (kbd "M-e") 'backward-kill-word)
(global-set-key (kbd "M-r") 'kill-word)

(global-set-key (kbd "M-o") 'move-beginning-of-line)
(global-set-key (kbd "M-p") 'move-end-of-line)
(global-set-key (kbd "M-t") 'kill-line)

(global-set-key (kbd "C-f") 'scroll-down)
(global-set-key (kbd "C-v") 'scroll-up)

(global-set-key (kbd "M-m") 'forward-sexp)
(global-set-key (kbd "M-n") 'backward-sexp)

;; killing, yanking
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-b") 'yank-pop)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-RET") 'newline)
(global-set-key (kbd "M-x") 'kill-region)

;; windows and buffers
(global-set-key (kbd "M-s") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)
(global-set-key (kbd "C-k") 'kill-buffer)

;; search
(global-set-key (kbd "M-w") 'isearch-forward)
(global-set-key (kbd "M-q") 'isearch-backward)
(define-key isearch-mode-map (kbd "M-w") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-q") 'isearch-repeat-backward)

;; misc
(global-set-key (kbd "M-/") 'undo)
(global-set-key (kbd "M-h") 'dabbrev-expand)
(global-set-key (kbd "M-a") 'execute-extended-command)
