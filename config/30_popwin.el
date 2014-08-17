(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq anything-samewindow nil)
(push '("*anything*" :height 20) popwin:special-display-config)
(push '("*helm*" :height 20) popwin:special-display-config)
(push '(" *auto-async-byte-compile*" :height 14 :position bottom :noselect t) popwin:special-display-config)
