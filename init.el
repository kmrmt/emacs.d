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
