(el-get 'sync '(auto-complete-clang))

(require 'auto-complete-clang)
(add-hook 'c-mode-hook
	  '(lambda ()
	     (add-to-list 'ac-sources 'ac-source-clang)))
