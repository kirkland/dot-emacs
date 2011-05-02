(defconst emacs-root (concat (getenv "HOME") "/.emacs.d/"))

;; put all junk in one place
(defconst emacs-scratch (concat (getenv "HOME") "/.scratch-emacs/"))
(make-directory emacs-scratch t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,emacs-scratch)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat emacs-scratch ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-scratch t)))

;; misc options
(and (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(and (fboundp 'scroll-bar-mode) (scroll-bar-mode 0))
(unless (eql system-type 'darwin)
    (menu-bar-mode -1))
(setq inhibit-startup-message t)
(setq enable-recursive-minibuffers t)
(setq column-number-mode t)
(setq find-file-visit-truename t)
(ansi-color-for-comint-mode-on) ; ?
(show-paren-mode 1)
(setq blink-matching-delay 0.5) ; ?
(global-font-lock-mode 1) ; aka syntax highlighting
(transient-mark-mode 1) ; active region is highlighted
(put 'erase-buffer 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(setq bookmark-save-flag 1) ; save bookmarks immediately
(setq bookmark-default-file (concat emacs-scratch "bookmarks.bmk"))
(setq scroll-conservatively 10000) ; scroll one line at a time
(setq tab-width 4)
(setq indent-tabs-mode nil)
(add-to-list 'load-path "~/emacs/")

;; run extra initialization. for some reason, when starting in daemon mode
;; on OSX, it can't find the font i want
(if (eql system-type 'darwin)
    (global-set-key [f12] (lambda ()
			    (interactive)
			    (set-face-attribute 'default nil :font "Andale Mono"))))


;; better undo. see documentation in undo-tree.el
(require 'undo-tree)
(global-undo-tree-mode)

;; buffer cycling tools
(require 'cycle-buffer)

;;;; misc functions		
(defun create-or-switch-to-term ()
  (interactive)
  (if (get-buffer "ansi-term")
      (switch-to-buffer (get-buffer "ansi-term"))
      (bash-term)))

(defun switch-to-most-recent-hidden-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) t)))

(defun bash-term ()
  "start ansi-term without asterisks so buffer switcher will not filter it out"
  (interactive)
  (ansi-term "/bin/bash")
  (let
    ((new-name (replace-regexp-in-string "\*" "" (buffer-name))))
    (rename-buffer new-name t)))

;;;; global bindings

;; movement
(global-set-key (kbd "M-;") 'forward-char)
(global-set-key (kbd "M-j") 'backward-char)
(global-set-key (kbd "M-k") 'next-line)
(global-set-key (kbd "M-l") 'previous-line)
(global-set-key (kbd "M-o") 'move-beginning-of-line)
(global-set-key (kbd "M-p") 'move-end-of-line)
(global-set-key (kbd "M-u") 'backward-word)
(global-set-key (kbd "M-i") 'forward-word)
(global-set-key (kbd "M-e") 'backward-kill-word)
(global-set-key (kbd "M-r") 'forward-kill-word)
(global-set-key (kbd "M-d") 'backward-delete-char)
(global-set-key (kbd "M-f") 'delete-char)
(global-set-key (kbd "M-n") 'beginning-of-buffer)
(global-set-key (kbd "M-m") 'end-of-buffer)

;; text manipulation
(global-set-key (kbd "M-t") 'kill-line)

;; undo/redo
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)

;; buffers and windows
(global-set-key (kbd "C-b") 'switch-to-buffer)
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-c t") 'create-or-switch-to-term)
(global-set-key (kbd "C-c C-t") 'create-or-switch-to-term)
(global-set-key (kbd "C-k") 'kill-buffer)
(global-set-key (kbd "C-<SPC>") 'other-window)
(global-set-key (kbd "C-S-<SPC>") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "C-<return>") 'cycle-buffer)
(global-set-key (kbd "C-S-<return>") 'cycle-buffer-backward)

;; other
(global-set-key (kbd "M-a") 'execute-extended-command)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-c l") 'longlines-mode)
(global-set-key (kbd "M-q") 'undo)
(global-set-key (kbd "M-<SPC>") 'set-mark-command)

;;;; mode bindings

;; isearch mode
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)

;;;; window/apple key bindings... probably want to avoid these
(global-set-key (kbd "s-b") 'switch-to-buffer)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/emacs/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-lethe)

;; minibuffer completion
(require 'ido)
(ido-mode)

;; start server. then, use emacs-newwindow to connect to it
(unless (eql system-type 'darwin)
  (unless server-process
    (server-start)))
