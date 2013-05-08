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

(el-get 'sync '(ac-nrepl))

(require 'nrepl)
(require 'ac-nrepl)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

;; setting for auto-complete in repl
(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode 'set-auto-complete-as-completion-at-point-function)
