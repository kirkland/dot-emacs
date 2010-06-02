;; misc
(defun copy-current-line-as-comment ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (insert ";")
  (yank)
  (newline)
  (yank))
