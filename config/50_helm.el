(require 'helm-config)
(require 'helm-migemo)
(global-set-key "\C-ca" 'helm)

(define-key helm-map (kbd "C-M-n") 'helm-next-source)
(define-key helm-map (kbd "C-M-p") 'helm-previous-source)
(define-key helm-map (kbd "L") 'helm-execute-presistent-action)

;; Automatically collect symbols by 150secs
(helm-lisp-complete-symbol-set-timer 150)

;; replace completetion commands with anything
(helm-read-string-mode 0)
(global-set-key "\M-x" 'helm-execute-extended-command)

