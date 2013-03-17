(el-get 'sync '(clojure-mode))
(el-get 'sync '(paredit))
(el-get 'sync '(paredit-extension))

(require 'clojure-mode)
(require 'paredit)

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (nrepl-eldoc-enable-in-current-buffer)))
