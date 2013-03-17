(el-get 'sync '(anything))
(el-get 'sync '(anything-config))
(el-get 'sync '(anything-grep))
(el-get 'sync '(anything-c-moccur))
(el-get 'sync '(anything-obsolete))

(require 'anything-config)
(require 'anything)
(global-set-key "\C-ca" 'anything)

(define-key anything-map (kbd "C-M-n") 'anything-next-source)
(define-key anything-map (kbd "C-M-p") 'anything-previous-source)
(define-key anything-map (kbd "L") 'anything-execute-presistent-action)

;; anything-match-plugin
(require 'anything-match-plugin)

;; anything-complete
(require 'anything-complete)

;; Automatically collect symbols by 150secs
(anything-lisp-complete-symbol-set-timer 150)

;; replace completetion commands with anything
(anything-read-string-mode 0)
(global-set-key "\M-x" 'anything-execute-extended-command)

;; anything-grep
;; http://d.hatena.ne.jp/rubikitch/20090106/anythinggrep
(require 'anything-grep)

;; anything-mooccur
;; http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
;;; color-moccur.elの設定
(require 'color-moccur)
;; 複数の検索語や、特定のフェイスのみマッチ等の機能を有効にする
;; 詳細は http://www.bookshelf.jp/soft/meadow_50.html#SEC751
(setq moccur-split-word t)
;; migemoがrequireできる環境ならmigemoを使う
(when (require 'migemo nil t) ; 第三引数がnon-nilだとloadできなかった場合にエラーではなくnilを返す
  (setq moccur-use-migemo t))

;;; anything-c-moccurの設定
(require 'anything-c-moccur)
;; カスタマイズ可能変数の設定(M-x customize-group anything-c-moccur でも設定可能)
(setq anything-c-moccur-anything-idle-delay 0.1 ;`anything-idle-delay'
      anything-c-moccur-higligt-info-line-flag t ; `anything-c-moccur-dmoccur'などのコマンドでバッファの情報をハイライトする
      anything-c-moccur-enable-auto-look-flag t ; 現在選択中の候補の位置を他のwindowに表示する
      anything-c-moccur-enable-initial-pattern t) ; `anything-c-moccur-occur-by-moccur'の起動時にポイントの位置の単語を初期パターンにする

;;; キーバインドの割当(好みに合わせて設定してください)
(global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur) ;バッファ内検索
(global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur) ;ディレクトリ
(add-hook 'dired-mode-hook ;dired
          '(lambda ()
             (local-set-key (kbd "O") 'anything-c-moccur-dired-do-moccur-by-moccur)))

(setq anything-sources (list anything-c-source-buffers+
                             anything-c-source-recentf
                             anything-c-source-bookmarks
                             anything-c-source-man-pages
                             anything-c-source-file-name-history
                             anything-c-source-locate
                             anything-c-source-complex-command-history
                             anything-c-source-emacs-commands
                             anything-c-source-emacs-functions
                             anything-c-source-buffer-not-found))
