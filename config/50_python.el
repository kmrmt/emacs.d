(use-package jedi
  :ensure t
  :defer t
  :preface
  (declare-function jedi:goto-definition jedi nil)
  (declare-function jedi:related-names jedi nil)
  (declare-function jedi:show-doc jedi nil)
  :bind
  (("C-." . jedi:goto-definition)
   ("C-c r" . jedi:related-names)
   ("C-?" . jedi:show-doc)))

(use-package flycheck-pyflakes
  :ensure t
  :defer t)
