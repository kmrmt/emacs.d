(el-get 'sync '(haskell-mode))
(require 'haskell-mode)
(require 'haskell-cabal)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.hs$" . haskell-mode)
                ("\\.hi$" . haskell-mode)
                ("\\.lhs$" . literate-haskell-mode)
		("\\.cabal\\'" . haskell-cabal-mode))))

(setq interpreter-mode-alist
      (append interpreter-mode-alist
	      '(("runghc" . haskell-mode)
		("runhaskell" . haskell-mode))))

(add-to-list 'exec-path (concat (getenv "HOME") "/.cabal/bin"))
(add-to-list 'load-path "~/.emacs.d/elisp/ghc-mod")

(autoload 'ghc-init "ghc" nil t)

(add-hook 'haskell-mode-hook
	  (lambda () (ghc-init)))


(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)

(defvar anything-c-source-ghc-mod
  '((name . "ghc-browse-document")
    (init . anything-c-source-ghc-mod)
    (candidates-in-buffer)
    (candidate-number-limit . 9999999)
    (action ("Open" . anything-c-source-ghc-mod-action))))

(defun anything-c-source-ghc-mod ()
  (unless (executable-find "ghc-mod")
    (error "ghc-mod を利用できません。ターミナルで which したり、*scratch* で exec-path を確認したりしましょう"))
  (let ((buffer (anything-candidate-buffer 'global)))
    (with-current-buffer buffer
      (call-process "ghc-mod" nil t t "list"))))

(defun anything-c-source-ghc-mod-action (candidate)
  (interactive "P")
  (let* ((pkg (ghc-resolve-package-name candidate)))
    (anything-aif (and pkg candidate)
        (ghc-display-document pkg it nil)
      (message "No document found"))))

(defun anything-ghc-browse-document ()
  (interactive)
  (anything anything-c-source-ghc-mod))

;; M-x anything-ghc-browse-document() に対応するキーの割り当て
;; ghc-mod の設定のあとに書いた方がよいかもしれません
(add-hook 'haskell-mode-hook
  (lambda()
    (define-key haskell-mode-map (kbd "C-M-d") 'anything-ghc-browse-document)))
