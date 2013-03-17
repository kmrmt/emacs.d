(el-get 'sync '(replace-colorthemes))
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/replace-colorthemes")

(el-get 'sync '(tango-2-theme))
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/tango-2-theme")

(el-get 'sync '(twilight-theme))
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/twilight-theme")

(el-get 'sync '(pastels-on-dark-theme))
(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/pastels-on-dark-theme")

(load-theme 'pastels-on-dark t)
(enable-theme 'pastels-on-dark)
