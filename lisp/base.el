
;;======================================================================
;;状态栏
;;======================================================================

;;显示列号
(setq column-number-mode t)

(global-linum-mode 1)


;;显示标题栏 %f 缓冲区完整路径 %p 页面百分数 %l 行号
(setq frame-title-format "%f")

;;=======================================================================
;;缓冲区
;;=====================================================================
;;设定行距
(setq default-line-spaceing 4)
;;页宽
(setq default-fill-column 80)
;;缺省模式 text-mode
;;(setq default-major-mode 'text-mode)
;;设置删除记录
(setq kill-ring-max 200)
;;以空行结束
;;(setq require-final-newline t)
;;开启语法高亮。
(global-font-lock-mode 1)
;;高亮显示区域选择
(transient-mark-mode t)
;;页面平滑滚动,scroll-margin 3 靠近屏幕边沿3行开始滚动，正好可以看到上下文
;;(setq scroll-margin 3 scroll-consrvatively 10000)
;;高亮显示成对括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;鼠标指针避光标
(mouse-avoidance-mode 'animate)
;;粘贴于光标处,而不是鼠标指针处
(setq mouse-yank-at-point t)

;;=======================================================================
;;回显区
;;=======================================================================
;;闪屏报警
(setq visible-bell t)

;;锁定行高
(setq resize-mini-windows nil)
;;递归minibuffer
(setq enable-recursive-minibuffers t)
;;当使用M-x COMMAND后，过1秒显示该COMMAND绑定的键
(setq suggest-key-bindings-1)   ;;默认？

;;======================================================================
;;编辑器的设定
;;======================================================================
;;不产生备份文件
(setq make-backup-files nil)
;;不生成临时文件
(setq-default make-backup-files nil)
;;只渲染当前屏幕语法高亮，加快显示速度
(setq lazy-lock-defer-on-scrolling t)
;;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
;;将错误信息显示在回显区

;;使用X剪贴板
(setq x-select-enable-clipboard t)
;;设定剪贴板的内容格式 适应Firefox
(set-clipboard-coding-system 'ctext)

;;设置TAB宽度为4
(setq default-tab-width 4) 
;;以下设置缩进
;;用tab缩进
(setq indent-tabs-mode t)
(setq c-indent-level 4)
(setq c-continued-statement-offset 4)
(setq c-brace-offset -4)
(setq c-argdecl-indent 4)
(setq c-label-offset -4)
(setq c-basic-offset 4)
(global-set-key "\C-m" 'reindent-then-newline-and-indent)



;;设置默认工作目录
(setq default-directory "~/work/") 

;;===============================================================
;;外观设置
;;===============================================================

;;关闭开启画面
(setq inhibit-startup-message t)


;;自动重载更改的文件
(global-auto-revert-mode 1)
;;custome的风格改为单一的树状风格
(setq custom-buffer-style 'brackets)


;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;可以递归的使用 minibuffer
(setq enable-recursive-minibuffers t)

;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文
(setq scroll-margin 3  scroll-conservatively 10000)

;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill) 

;; 在行首 C-k 时，同时删除该行。
(setq-default kill-whole-line t)

;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
(add-hook 'comint-output-filter-functions
      'comint-watch-for-password-prompt)

;;把这些缺省禁用的功能打开
(put 'scroll-left 'disabled nil)     ;允许屏幕左移
(put 'scroll-right 'disabled nil)    ;允许屏幕右移
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil) 
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;使用鼠标中键可以粘贴
(setq mouse-yank-at-point t)

;; 自动的在文件末增加一新行
(setq require-final-newline t)

;;Non-nil if Transient-Mark mode is enabled.
(setq-default transient-mark-mode t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 当浏览 man page 时，直接跳转到 man buffer。
(setq Man-notify-method 'pushy)


(setq speedbar-update-flag nil)
(setq speedbar-use-images nil);;不使用 image 的方式
(setq speedbar-verbosity-level 0)


;; 设置时间戳，标识出最后一次保存文件的时间。
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chenyang")


;====================== rect-mark设置 =========================
;; 按下shift拖拽鼠标即可选择矩形区域
;; Support for marking a rectangle of text with highlighting.
(require 'rect-mark)
(define-key ctl-x-map "r\C-@" 'rm-set-mark)
(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)

;; Use this section in your "~/.emacs" to modify picture mode so that
;; it automatically uses the rect-mark equivalents of many commands.

;; One vision of a better picture mode.
(add-hook 'picture-mode-hook 'rm-example-picture-mode-bindings)
(autoload 'rm-example-picture-mode-bindings "rect-mark"
  "Example rect-mark key and mouse bindings for picture mode.")

;;; highlight parentheses surrounding cursor
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


(require 'wcy-desktop) 
(wcy-desktop-init)

(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)
(toggle-fullscreen)


;;set eshell environment variable
;;ccache is used to accelerate the compiling process
(setenv "CCACHE_DIR" "/dev/shm/ccache")
(setenv "CC" "ccache gcc")
(setenv "CXX" "ccache g++")
(setenv "PATH" (concat "/usr/lib/ccache:" (getenv "PATH")))

;;写博客测试
(require 'cnblogs)
(add-hook 'org-mode-hook (lambda ()
                           (cnblogs-minor-mode)))

;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)


;; Let backspace and delete be defined as usual if
;; nothing is highlighted, otherwise the marked region is deleted
(defun kill-something() (interactive)
  (if (and mark-active transient-mark-mode)
      (kill-region (point) (mark)) 
    (backward-delete-char-untabify 1)))
;;(global-set-key [delete] 'kill-something)
(global-set-key [backspace] 'kill-something)

(provide 'base)
