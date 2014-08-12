(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/local-recipes")
(el-get 'sync '(el-get))

;; init
(el-get 'sync '(init-loader))
(require 'init-loader)
(init-loader-load "~/.emacs.d/config/")

;; filenome prefix:
;; - 00 : fundamental settings
;; - 10 : pre load settings
;; - 20 : custom functions
;; - 30 : additional functions
;; - 40 : minor mode settings
;; - 50 : major mode settings
;; - 90 : post load settings
