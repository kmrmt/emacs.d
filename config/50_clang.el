(if run-darwin
    '(lambda ()
       
       (require 'auto-complete-clang)
       (add-hook 'c-mode-hook
                 '(lambda ()
                    (add-to-list 'ac-sources 'ac-source-clang)))))
