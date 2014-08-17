(require 'c-eldoc)
(add-hook 'c-mode-common-hook
          (lambda ()
            (set (make-local-variable 'eldoc-idle-delay) 0.1)
            (setq c-eldoc-cpp-command "/usr/bin/cpp")
            (c-turn-on-eldoc-mode)
            (local-set-key (kbd "C-c C-c") 'compile)))

;; google c style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
