(global-set-key (kbd "\C-x\C-b") 'bs-show) ; use buffer-selection-menu mode
(global-set-key "\C-z" 'shell)

;; move buffers around screens
(require 'buffer-move)
(global-set-key (kbd "C-c K")     'buf-move-up)
(global-set-key (kbd "C-c J")   'buf-move-down)
(global-set-key (kbd "C-c H")   'buf-move-left)
(global-set-key (kbd "C-c L")  'buf-move-right)

;; moving between windows
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)

;; copy
; (global-set-key (kbd "C-c w") 'copy-region-as-kill)  ; instead, use M-w for kill-ring-save

;; comment region
(global-set-key (kbd "C-c 9") 'comment-region)
(global-set-key (kbd "C-c 0") 'uncomment-region)

;; doesn't quit work, because the buffer doesn't need to be killed (necessarily),
;; but instead we want to kill the bash process
(defun quit-emacs (arg)
  "kill *shell* buffer and quit"
  (interactive "p")
  (if (bufferp (get-buffer "*shell*"))
      (kill-buffer "*shell*"))
  (save-buffers-kill-terminal))

; (global-set-key (kbd "C-x C-c") 'quit-emacs)

