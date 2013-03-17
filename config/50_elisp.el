(el-get 'sync '(eldoc-extension))

(require 'eldoc)
(require 'eldoc-extension)

(setq eldoc-idle-delay 0.2)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

(el-get 'sync '(auto-complete-emacs-lisp))

(require 'auto-complete-emacs-lisp)
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (add-to-list 'ac-sources 'ac-source-symbols)
	     (add-to-list 'ac-sources 'ac-source-functions)))
