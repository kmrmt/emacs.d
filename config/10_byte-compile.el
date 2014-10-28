;; auto-async-byte-compile
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; auto byte compile when *.el newer than *.elc
(when (and user-init-file
           (equal (file-name-extension user-init-file) "elc"))
  (let* ((source (file-name-sans-extension user-init-file))
         (alt (concat source ".el")))
    (setq source (cond ((file-exists-p alt) alt)
                       ((file-exists-p source) source)
                       (t nil)))
    (when source
      (when (file-newer-than-file-p source user-init-file)
        (byte-compile-file source)
                               (load-file source)
                               (eval-buffer nil nil)
                               (delete-other-windows)))))
