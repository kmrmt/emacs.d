(use-package auto-complete-config
  :ensure auto-complete
  :config
  (progn
    (add-to-list 'ac-dictionary-directories
                 "~/.emacs.d/auto-complete/dict")
    (ac-config-default)
    (global-auto-complete-mode t)))
