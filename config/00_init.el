;; detect OS
(defvar run-linux (equal system-type 'gnu/linux))
(defvar run-darwin (equal system-type 'darwin))

;; detect window system
(defvar run-cli (equal window-system nil))
(defvar run-cocoa (equal window-system 'ns))
(defvar run-carbon (equal window-system 'mac))

;; disable startup message
(setq inhibit-startup-message t)

;; disable bell
(setq ring-bell-function '(lambda ()))

;; disable backup file
(setq make-backup-files nil)

;; delete auto save file
(setq delete-auto-save-files t)

;; disable auto save
(setq auto-save-default nil)

;; enable delete select region
(delete-selection-mode 1)

;; use space for indent
(setq-default indent-tabs-mode nil)

;; short cut key
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cc" 'comment-or-uncomment-region)

;; enable show paren mode
(show-paren-mode 1)

;; font setting
(global-font-lock-mode t)
(setq-default transient-mark-mode t)
(require 'font-lock)

;; char code
(prefer-coding-system 'utf-8)

;; scroll step 1 line
(setq scroll-step 1)

;; return character
(setq truncate-partial-width-windows nil)

;; disable blink cursor
(blink-cursor-mode 0)

;; enable recentf
(recentf-mode t)

;; set large file warning threshold
(setq large-file-warning-threshold (* 25 1024 1024))

;; yes/no => y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; set garbage collection threshold
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; ignore character case
(setq completion-ignore-case t)

;; enable auto revert
(global-auto-revert-mode 1)

;; key remap ¥ to \
(if run-darwin
    (define-key global-map [?¥] [?\\]))
