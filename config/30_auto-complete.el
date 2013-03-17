(el-get 'sync '(auto-complete))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)
(global-auto-complete-mode t)
