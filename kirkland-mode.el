(defvar kirkland-minor-mode-map (make-keymap) "kirkland-minor-mode keymap.")

;; these bindings are redundant, or I want to force myself to not use them
(global-unset-key (kbd "M-d"))
(global-unset-key (kbd "M-e"))
(global-unset-key (kbd "M-f"))
(global-unset-key (kbd "M-w"))
(global-unset-key (kbd "M-."))
(global-unset-key (kbd "M-,"))
(global-unset-key (kbd "C-w"))

;; basic movement and editing 
(define-key kirkland-minor-mode-map (kbd "M-j") 'backward-char)
(define-key kirkland-minor-mode-map (kbd "M-;") 'forward-char)
(define-key kirkland-minor-mode-map (kbd "M-k") 'next-line)
(define-key kirkland-minor-mode-map (kbd "M-l") 'previous-line)
(define-key kirkland-minor-mode-map (kbd "M-d") 'delete-backward-char)
(define-key kirkland-minor-mode-map (kbd "M-f") 'delete-char)

(define-key kirkland-minor-mode-map (kbd "M-u") 'backward-word)
(define-key kirkland-minor-mode-map (kbd "M-i") 'forward-word)
(define-key kirkland-minor-mode-map (kbd "M-e") 'backward-kill-word)
(define-key kirkland-minor-mode-map (kbd "M-r") 'kill-word)

(define-key kirkland-minor-mode-map (kbd "M-o") 'move-beginning-of-line)
(define-key kirkland-minor-mode-map (kbd "M-p") 'move-end-of-line)
(define-key kirkland-minor-mode-map (kbd "M-t") 'kill-line)

(define-key kirkland-minor-mode-map (kbd "C-f") 'scroll-down)
(define-key kirkland-minor-mode-map (kbd "C-v") 'scroll-up)

(define-key kirkland-minor-mode-map (kbd "M-m") 'forward-sexp)
(define-key kirkland-minor-mode-map (kbd "M-n") 'backward-sexp)

;; killing, yanking
(define-key kirkland-minor-mode-map (kbd "M-v") 'yank)
(define-key kirkland-minor-mode-map (kbd "M-b") 'yank-pop)
(define-key kirkland-minor-mode-map (kbd "M-c") 'kill-ring-save)
(define-key kirkland-minor-mode-map (kbd "M-SPC") 'set-mark-command)
(define-key kirkland-minor-mode-map (kbd "M-RET") 'newline)
(define-key kirkland-minor-mode-map (kbd "M-x") 'kill-region)

;; windows and buffers
(define-key kirkland-minor-mode-map (kbd "M-s") (lambda () (interactive) (other-window 1)))
(define-key kirkland-minor-mode-map (kbd "M-0") 'delete-window)
(define-key kirkland-minor-mode-map (kbd "M-1") 'delete-other-windows)
(define-key kirkland-minor-mode-map (kbd "M-2") 'split-window-vertically)
(define-key kirkland-minor-mode-map (kbd "M-3") 'split-window-horizontally)

;; search
(define-key kirkland-minor-mode-map (kbd "M-w") 'isearch-forward)
(define-key kirkland-minor-mode-map (kbd "M-q") 'isearch-backward)
(define-key isearch-mode-map (kbd "M-w") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "M-q") 'isearch-repeat-backward)

;; misc
(define-key kirkland-minor-mode-map (kbd "M-/") 'undo)
(define-key kirkland-minor-mode-map (kbd "M-h") 'dabbrev-expand)
(define-key kirkland-minor-mode-map (kbd "M-a") 'execute-extended-command)

(define-minor-mode kirkland-minor-mode
  "A minor mode so that my key settings aren't shadowed by other major/minor modes"
  t " kirkland" 'kirkland-minor-mode-map)
