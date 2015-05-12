(custom-set-variables '(js2-rebind-eol-bol-keys nil))

(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

;; free C-m for default function, 'newline-and-indent
(define-key js2-mode-map (kbd "C-m") nil)

(add-hook 'js2-mode-hook
          '(lambda ()
             (require 'js)
             (setq js-indent-level 4
                   js-expr-indent-offset 4
                   indent-tabs-mode nil)
             (set (make-local-variable 'indent-line-function) 'js-indent-line)))

;; js-doc
(require 'js-doc)
(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
             (local-set-key (kbd "@") 'js-doc-insert-tag)))
