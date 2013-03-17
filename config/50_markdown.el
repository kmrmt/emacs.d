(el-get 'sync '(markdown-mode))
(require 'markdown-mode)

(setq auto-mode-alist
      (append '(("\\.mk?d$" . markdown-mode)
                ("\\.markdown$" . markdown-mode))
              auto-mode-alist))
(add-hook 'markdown-mode-hook 'flyspell-mode)
