(custom-set-variables '(js2-rebind-eol-bol-keys nil))

(el-get 'sync '(js2-mode))
(require 'js2-mode)
(el-get 'sync '(js2-highlight-vars-mode))
(require 'js2-highlight-vars)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

(set-face-underline-p 'js2-highlight-vars-face t)
(set-face-underline 'js2-highlight-vars-face "#7F7FFF")

;; free C-m for default function, 'newline-and-indent
(define-key js2-mode-map (kbd "C-m") nil)

(add-hook 'js2-mode-hook
          '(lambda ()
             (require 'js)
             (setq js-indent-level 4
                   js-expr-indent-offset 4
                   indent-tabs-mode nil)
             (set (make-local-variable 'indent-line-function) 'js-indent-line)
             (if (featurep 'js2-highlight-vars)
                 (js2-highlight-vars-mode))))

;; js-doc
(el-get 'sync '(js-doc))
(require 'js-doc)
(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
             (local-set-key (kbd "@") 'js-doc-insert-tag)))
