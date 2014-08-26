(setq load-path
      (append (list (expand-file-name "~/.emacs.d/site-lisp")
                    (expand-file-name "~/.emacs.d/vendor"))
              load-path))

(if (file-exists-p "~/.cask/cask.el")
    (require 'cask "~/.cask/cask.el")
  (require 'cask))
(cask-initialize)

;; init
(require 'init-loader)
(init-loader-load (expand-file-name "~/.emacs.d/config/"))

;; filenome prefix:
;; - 00 : fundamental settings
;; - 10 : pre load settings
;; - 20 : custom functions
;; - 30 : additional functions
;; - 40 : minor mode settings
;; - 50 : major mode settings
;; - 90 : post load settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(js2-rebind-eol-bol-keys nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
