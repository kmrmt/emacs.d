;;; init.el --- emacs entry point
;;; Commentary:
;;; Code:

(require 'package)
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defmacro append-to-list (to lst)
  `(progn (mapcar (lambda (arg) (add-to-list ,to arg)) ,lst)
	  (eval ,to)))

(append-to-list 'package-archives
                '(("gnu" . "http://elpa.gnu.org/packages/")
                  ("melpa-stable" . "https://stable.melpa.org/packages/")
                  ("melpa" . "http://melpa.org/packages/")
                  ("mamalade" . "https://marmalade-repo.org/packages/")
                  ("org" . "http://orgmode.org/elpa/")))

;; use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; init
(use-package init-loader
  :ensure t
  :config
  (init-loader-load (expand-file-name "~/.emacs.d/config/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-rebind-eol-bol-keys nil)
 '(package-selected-packages
   (quote
    (flycheck-pyflakes jedi use-package init-loader helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
