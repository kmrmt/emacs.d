(use-package markdown-mode
  :ensure t
  :defer t
  :config
  (progn
    (setq auto-mode-alist
          (append '(("\\.mk?d$" . markdown-mode)
                    ("\\.markdown$" . markdown-mode))
                  auto-mode-alist))
    (add-hook 'markdown-mode-hook 'flyspell-mode)))
