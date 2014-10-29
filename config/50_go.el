(add-to-list 'exec-path (expand-file-name (concat (getenv "GOPATH") "/bin")))

(require 'go-mode)
(require 'auto-complete-config)
(require 'go-autocomplete)
(require 'go-eldoc)

(add-hook 'go-mode-hook '(lambda()
                          (setq tab-width 2)
                          (setq indent-tabs-mode 1)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-M-a") 'beginning-of-defun)
                          (local-set-key (kbd "C-M-h") 'mark-defun)
                          (local-set-key (kbd "C-x n d") 'narrow-to-defun)
                          (local-set-key (kbd "C-c C-d") 'godef-describe)))
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'go-direx)
(define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer)

(push '("^\*go-direx:" :regexp t :position left :width 0.4 :dedicated t :stick t)
      popwin:special-display-config)
