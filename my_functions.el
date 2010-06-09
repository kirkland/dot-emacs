;; misc
(defun copy-current-line ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (yank)
  (newline)
  (yank))
