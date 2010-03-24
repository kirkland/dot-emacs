;; basic movement and editing 
(global-set-key (kbd "M-h") 'backward-char)
(global-set-key (kbd "M-l") 'forward-char)
(global-set-key (kbd "M-j") 'next-line)
(global-set-key (kbd "M-k") 'previous-line)

(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-f") 'delete-char)

(global-set-key (kbd "M-y") 'backward-word)
(global-set-key (kbd "M-o") 'forward-word)
(global-set-key (kbd "M-u") 'backward-kill-word)
(global-set-key (kbd "M-i") 'kill-word)

(global-set-key (kbd "M-e") 'move-beginning-of-line)
(global-set-key (kbd "M-r") 'move-end-of-line)
(global-set-key (kbd "M-w") 'kill-line)

(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "M-n") 'scroll-up)

;; killing, yanking
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-s") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "M-S") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-b") 'yank-pop)

;; files / buffers
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-b") 'bs-show)
(global-set-key (kbd "C-w") 'close-current-buffer)

;; windows
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-vertically)
(global-set-key (kbd "M-3") 'split-window-horizontally)

;; misc
(global-set-key (kbd "M-/") 'undo)
(global-set-key (kbd "M-;") 'isearch-forward)
(global-set-key (kbd "M-:") 'isearch-backward)
(global-set-key (kbd "M-t") 'dabbrev-expand)
(global-set-key (kbd "M-a") 'execute-extended-command)
(global-set-key (kbd "<f5>") (lambda () (interactive) (load-file "global-keys.el")))

(global-set-key (kbd "C-x C-b") 'bs-show) ; use buffer-selection-menu mode
(global-set-key (kbd "C-z") 'shell)
(global-set-key (kbd "C-c y") 'clipboard-yank)