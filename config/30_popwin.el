(use-package popwin
  :ensure t
  :config
  (progn
    (popwin-mode 1)

    (setq helm-samewindow nil)
    (push '("helm" :height 20) popwin:special-display-config)
    (push '(" *auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)))
