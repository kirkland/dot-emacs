;; inspired by ergoemacs, except I want to make global bindings, not a minor mode. 

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

(global-set-key (kbd "M-e") 'move-end-of-line)
(global-set-key (kbd "M-w") 'move-beginning-of-line)

(global-set-key (kbd "M-r") 'kill-line)

(global-set-key (kbd "M-p") 'scroll-down)
(global-set-key (kbd "M-n") 'scroll-up)

;; killing, yanking
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-s") (lambda () (interactive) (other-window 1)))
(global-set-key (kbd "M-S") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-x") 'kill-region)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-v") 'yank)

;; files
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)

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