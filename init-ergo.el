;; ergo mode
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us") ; customized by me to make more vim-like
(load "~/.emacs.d/ergoemacs-keybindings-5.1/ergoemacs-mode")
(ergoemacs-mode 1)

(tool-bar-mode -1)
(scroll-bar-mode 0)
(menu-bar-mode -1)
(setq inhibit-startup-message t)