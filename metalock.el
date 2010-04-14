(defvar metalock-minor-mode-map (make-keymap) "metalock-minor-mode keymap.")

(define-key metalock-minor-mode-map (kbd "j") 'backward-char)
(define-key metalock-minor-mode-map (kbd ";") 'forward-char)
(define-key metalock-minor-mode-map (kbd "k") 'next-line)
(define-key metalock-minor-mode-map (kbd "l") 'previous-line)

(global-set-key (kbd "C-q") 'metalock-minor-mode)

(define-minor-mode metalock-minor-mode
  "A minor mode that is the equivalent of holding down the Meta key"
  t " metalock" 'metalock-minor-mode-map)