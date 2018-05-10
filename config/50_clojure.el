(use-package clojure-mode
  :ensure t
  :config
  (progn
    (use-package paredit :ensure t)
    (use-package cider :ensure t)
    (use-package rainbow-delimiters :ensure t)
    
    (add-hook 'clojure-mode-hook 'parendit-mode)
    (add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'cider-repl-mode-hook 'paredit-mode)
    (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)))
