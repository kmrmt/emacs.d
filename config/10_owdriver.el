(require 'owdriver)
(global-unset-key (kbd "M-o"))
(setq owdriver-prefix-key "M-o")
(owdriver-config-default)
;;; これを入れておくことでM-o M-oで対象ウィンドウを選択できる
(owdriver-add-keymap owdriver-prefix-key 'owdriver-next-window)
(owdriver-mode 1)
