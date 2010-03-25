(defvar kirkland-minor-mode-map (make-keymap) "kirkland-minor-mode keymap.")

;; basic movement and editing 
(define-key kirkland-minor-mode-map (kbd "M-h") 'backward-char)
(define-key kirkland-minor-mode-map (kbd "M-l") 'forward-char)
(define-key kirkland-minor-mode-map (kbd "M-j") 'next-line)
(define-key kirkland-minor-mode-map (kbd "M-k") 'previous-line)
(define-key kirkland-minor-mode-map (kbd "M-d") 'delete-backward-char)
(define-key kirkland-minor-mode-map (kbd "M-f") 'delete-char)

(define-key kirkland-minor-mode-map (kbd "M-y") 'backward-word)
(define-key kirkland-minor-mode-map (kbd "M-o") 'forward-word)
(define-key kirkland-minor-mode-map (kbd "M-u") 'backward-kill-word)
(define-key kirkland-minor-mode-map (kbd "M-i") 'kill-word)

(define-key kirkland-minor-mode-map (kbd "M-w") 'move-beginning-of-line)
(define-key kirkland-minor-mode-map (kbd "M-e") 'move-end-of-line)
(define-key kirkland-minor-mode-map (kbd "M-r") 'kill-line)

(define-key kirkland-minor-mode-map (kbd "M-p") 'scroll-down)
(define-key kirkland-minor-mode-map (kbd "M-n") 'scroll-up)

;; killing, yanking
(define-key kirkland-minor-mode-map (kbd "M-SPC") 'set-mark-command)
(define-key kirkland-minor-mode-map (kbd "M-s") (lambda () (interactive) (other-window 1)))
(define-key kirkland-minor-mode-map (kbd "M-S") (lambda () (interactive) (other-window -1)))
(define-key kirkland-minor-mode-map (kbd "M-x") 'kill-region)
(define-key kirkland-minor-mode-map (kbd "M-c") 'kill-ring-save)
(define-key kirkland-minor-mode-map (kbd "M-v") 'yank)
(define-key kirkland-minor-mode-map (kbd "M-b") 'yank-pop)

;; files / buffers
(define-key kirkland-minor-mode-map (kbd "C-o") 'find-file)
(define-key kirkland-minor-mode-map (kbd "C-s") 'save-buffer)
(define-key kirkland-minor-mode-map (kbd "C-b") 'bs-show)
(define-key kirkland-minor-mode-map (kbd "C-w") 'close-current-buffer)

;; windows
(define-key kirkland-minor-mode-map (kbd "M-0") 'delete-window)
(define-key kirkland-minor-mode-map (kbd "M-1") 'delete-other-windows)
(define-key kirkland-minor-mode-map (kbd "M-2") 'split-window-vertically)
(define-key kirkland-minor-mode-map (kbd "M-3") 'split-window-horizontally)

;; misc
(define-key kirkland-minor-mode-map (kbd "M-/") 'undo)
(define-key kirkland-minor-mode-map (kbd "M-;") 'isearch-forward)
(define-key kirkland-minor-mode-map (kbd "M-:") 'isearch-backward)
(define-key kirkland-minor-mode-map (kbd "M-t") 'dabbrev-expand)
(define-key kirkland-minor-mode-map (kbd "M-a") 'execute-extended-command)
(define-key kirkland-minor-mode-map (kbd "<f5>") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))

(define-key kirkland-minor-mode-map (kbd "C-x C-b") 'bs-show) ; use buffer-selection-menu mode
(define-key kirkland-minor-mode-map (kbd "C-z") 'shell)
(define-key kirkland-minor-mode-map (kbd "C-c y") 'clipboard-yank)

(define-minor-mode kirkland-minor-mode
  "A minor mode so that my key settings aren't shadowed by other major/minor modes"
  t " kirkland" 'kirkland-minor-mode-map)
