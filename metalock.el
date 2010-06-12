;; TODO: change global-set-key to define-key..., map non-used chars to nothing

(defvar metalock-minor-mode-map (make-keymap) "metalock-minor-mode keymap.")

(define-key metalock-minor-mode-map (kbd "j") 'backward-char)
(define-key metalock-minor-mode-map (kbd "k") 'next-line)
(define-key metalock-minor-mode-map (kbd "l") 'previous-line)
(define-key metalock-minor-mode-map (kbd ";") 'forward-char)
(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-i") 'forward-word)

(global-set-key (kbd "M-d") 'delete-backward-char)
(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-e") 'backward-kill-word)
(global-set-key (kbd "M-r") 'kill-word)

(global-set-key (kbd "M-o") 'move-beginning-of-line)
(global-set-key (kbd "M-p") 'move-end-of-line)
(global-set-key (kbd "M-t") 'kill-line)

(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key (kbd "M-q") 'metalock-minor-mode)
(define-minor-mode metalock-minor-mode
  "A minor mode that is the equivalent of holding down the Meta key"
  t " metalock" 'metalock-minor-mode-map)