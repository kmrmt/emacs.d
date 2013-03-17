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

(el-get 'sync '(auto-complete-etags))
(el-get 'sync '(etags-table))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e9a1226ffed627ec58294d77c62aa9561ec5f42309a1f7a2423c6227e34e3581" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "8376ccdd8b8fa4e654a874f9e5b04499f7fd1b4b17e8597fbc500963b14217db" "211bb9b24001d066a646809727efb9c9a2665c270c753aa125bace5e899cb523" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
