;;;; integ mode

(define-generic-mode integ-mode
  '("//")
  '("object")
  '(("TASK\\|TSKL\\|PARM\\|INPT\\|PROC\\|OUTP" . 'font-lock-variable-name-face))
  '(".int\\'")
  nil)
