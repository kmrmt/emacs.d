(el-get 'sync '(auto-complete-ruby))
(el-get 'sync '(rcodetools))
(el-get 'sync '(ruby-block))
(el-get 'sync '(ruby-electric))
(el-get 'sync '(ruby-mode))
(el-get 'sync '(rvm))
(el-get 'sync '(flymake-ruby))

(eval-when-compile (require 'cl))
(require 'rvm)
(require 'rcodetools)
(require 'auto-complete-ruby)
(require 'ruby-electric)
(require 'ruby-block)
(require 'ruby-mode)

(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (ruby-electric-mode t)
             (ruby-block-mode t)
             (setq ruby-block-highlight-toggle t)
             (setq semantic-load-turn-useful-things-on t)))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (when (and (fboundp 'rvm-use-default) (not (featurep 'rvm)))
               (rvm-use-default))))

(defun flymake-ruby-init ()
  (flymake-simple-generic-init "ruby" '("-c")))
(push '("\\.\\(?:rb\|erb\\)\\'" flymake-ruby-init) flymake-allowed-file-name-masks)