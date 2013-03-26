;; menu bar disable CUI mode
(if (or run-cocoa run-carbon)
    (menu-bar-mode 1) (menu-bar-mode 0))

;; disable visual bell
(setq visible-bell nil)

(modify-frame-parameters (selected-frame) '((alpha . 90 )))

;; show line & column number
(line-number-mode t)
(column-number-mode t)

;; show time
(display-time)

;; show battery status
(if run-darwin
    (display-battery-mode t))

;; highlight current line
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "ForestGreen"))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; powerline
(if (or run-carbon run-cocoa)
    '(lambda ()
       (el-get 'sync '(powerline))
       (require 'powerline)
       ;; バッファ情報の書式
       (defpowerline buffer-id (propertize (car (propertized-buffer-identification "%b"))
                                           'face (powerline-make-face color1)))
       (defpowerline row     "%l")    ; 行番号の書式
       (defpowerline column  "%c")    ; 列番号の書式
       (defpowerline percent "%p")    ; カーソル位置の割合
       (defpowerline time    "%M")    ; 時計の書式
       ;; 右部分の位置合わせ(右端から何文字分を左に寄せるか、デフォルト+15文字)
       (defun powerline-make-fill (color)
         (let ((plface (powerline-make-face color)))
           (if (eq 'right (get-scroll-bar-mode))
               (propertize " " 'display '((space :align-to (- right-fringe 36))) 'face plface)
             (propertize " " 'display '((space :align-to (- right-fringe 39))) 'face plface))))
       ;; Powerlineの書式
       (setq-default mode-line-format (list
                                       '("-" mode-line-mule-info mode-line-modified)
                                       '(:eval (concat
                                                (powerline-buffer-id   'left   nil powerline-color1)
                                                (powerline-major-mode  'left       powerline-color1)
                                                (powerline-minor-modes 'left       powerline-color1)
                                                (powerline-narrow      'left       powerline-color1 powerline-color2)
                                                (powerline-vc          'center                      powerline-color2)
                                                (powerline-make-fill                                powerline-color2)
                                                (powerline-row         'right      powerline-color1 powerline-color2)
                                                (powerline-make-text   ": "        powerline-color1)
                                                (powerline-column      'right      powerline-color1)
                                                (powerline-percent     'right      powerline-color1)
                                                (powerline-time        'right  nil powerline-color1)
                                                (powerline-make-text   "  "    nil )))))
       ;; 時計のフォーマット
       (setq display-time-string-forms '((format
                                          "%s/%s(%s) %s:%s" month day dayname 24-hours minutes)))))
