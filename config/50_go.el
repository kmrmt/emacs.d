(use-package go-mode
  :ensure t
  :defer t
  :mode ("\\.go" . go-mode)
  :config
  (progn
    (add-to-list 'exec-path (expand-file-name (concat (getenv "GOPATH") "/bin")))
    (add-hook 'go-mode-hook '(lambda()
                               (setq tab-width 2)
                               (setq indent-tabs-mode 1)))
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
    (local-set-key (kbd "M-.") 'godef-jump)
    (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
    (local-set-key (kbd "C-M-a") 'beginning-of-defun)
    (local-set-key (kbd "C-M-h") 'mark-defun)
    (local-set-key (kbd "C-x n d") 'narrow-to-defun)
    (local-set-key (kbd "C-c C-d") 'godef-describe)))


(use-package go-autocomplete
  :ensure t
  :defer t
  :config
  (add-to-list 'ac-modes 'go-mode))

(use-package go-eldoc
  :ensure t
  :defer t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))


(use-package go-direx
  :ensure t
  :defer t
  :config
  (progn
    (define-key go-mode-map (kbd "C-c C-j") 'go-direx-pop-to-buffer)
    (push '("^\*go-direx:" :regexp t :position left :width 0.4 :dedicated t :stick t)
          popwin:special-display-config)))
