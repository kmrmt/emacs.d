(el-get 'sync '(mmm-mode))
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)

(set-face-background 'mmm-default-submode-face "#222222")

(mmm-add-classes
 '((mmm-html-css
    :submode css-mode
    :front "<style[^>]*>"
    :back "</style>")))
(mmm-add-mode-ext-class nil "\\.html?\\'" 'mmm-html-css)

(mmm-add-classes
 '((mmm-html-js
    :submode js2-mode
    :front "<script[^>]*?[^<]"
    :front-offset -1
    :back "\n?[ \t]*</script>")))
(mmm-add-mode-ext-class nil "\\.html?\\'" 'mmm-html-js)
