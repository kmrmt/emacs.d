(el-get 'sync '(php-mode))

(require 'php-mode)
(setq php-mode-force-pear t)
(add-hook 'php-mode-hook
          '(lambda ()
             "Set some buffer-local variables."
             (setq case-fold-search t)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)))
(add-hook 'php-mode-hook
          '(lambda ()
             (c-set-style "stroustrup")))
