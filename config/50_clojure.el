(require 'clojure-mode)
(require 'paredit)
(require 'cider)
(require 'rainbow-delimiters)

(add-hook 'clojure-mode-hook 'parendit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
