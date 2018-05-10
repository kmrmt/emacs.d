(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode t)
    (global-set-key (kbd "M-/") 'undo-tree-redo)))
