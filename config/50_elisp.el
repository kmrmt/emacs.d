(use-package eldoc
  :ensure t
  :config
  (progn
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
    (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
    
    (add-hook 'emacs-lisp-mode-hook
              '(lambda ()
                 (add-to-list 'ac-sources 'ac-source-symbols)
                 (add-to-list 'ac-sources 'ac-source-functions)))))

(use-package eldoc-extension
  :init (el-get-bundle emacswiki:eldoc-extension))
