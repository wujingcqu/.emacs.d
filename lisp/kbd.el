;;-----------------redo
(require 'redo)
(global-set-key ( kbd "C-.") 'redo)

(global-set-key [f1] 'manual-entry)
(global-set-key [C-f1] 'info )

;;f3为查找字符串,alt+f3 find the gloable definition
(global-set-key [f3] 'grep-find)
(global-set-key [M-f3] 'cscope-find-global-definition)
(global-set-key [C-f3] 'search-forward)

;;.emacs中设一个speedbar的快捷键
(global-set-key [(f4)] 'speedbar-get-focus)
;;ctrl-f4,激活,ecb
(global-set-key [C-f4] 'ecb-activate)

;;F5显示/隐藏工具栏 方便调试
(global-set-key [f5] 'tool-bar-mode)
;;ctrl-F5显示/隐藏菜单栏 ;; M-x menu-bar-open
(global-set-key [C-f5] 'menu-bar-mode)

(global-set-key [f6] 'gdb)

;;  C-f7, 设置编译命令; f7, 保存所有文件然后编译当前窗口文件
(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (switch-to-buffer-other-window "*compilation*")
  (compile compile-command))
  
(setq-default compile-command "make")    
(global-set-key [C-f7] 'compile)
(global-set-key [f7] 'du-onekey-compile)


;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell,shift+f8清空eshell
(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))
;;I changed the eshell to multi-term, because multi-term is much more functional than eshell
(defun open-term-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (shell))

(defun my-eshell-clear-buffer ()
  "Eshell clear buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))
(global-set-key [(f8)] 'open-term-other-buffer)
(global-set-key [C-f8] 'eshell)
(global-set-key [S-f8] 'my-eshell-clear-buffer)

;;设置[C-f9]为调用dired命令
(global-set-key [C-f9] 'dired)
(global-set-key [f9] 'other-window);f9在其他窗口之间旋转

;;设置C-F10为撤销
(global-set-key [C-f10] 'undo)

;;设置F11快捷键指定Emacs 的日历系统
(global-set-key [C-f11] 'calendar) 

;;设置C-F12 快速察看日程安排
;;F12调到函数定义
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [C-f12] 'list-bookmarks)
;;shift-f12跳回去
(global-set-key [S-f12]
	(lambda ()
	(interactive)
	(if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
	(error "Semantic Bookmark ring is currently empty"))
	(let* ((ring (oref semantic-mru-bookmark-ring ring))
	(alist (semantic-mrub-ring-to-assoc-list ring))
	(first (cdr (car alist))))
	(if (semantic-equivalent-tag-p (oref first tag)
	(semantic-current-tag))
	(setq frist (cdr (car (cdr alist)))))
	(semantic-mrub-switch-tags first))))

;;==================ecb的配置=================================
;;为了ecb窗口的切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;;for fast change between two fremes(in dual monitor mode)
(global-set-key (kbd "M-RET")   'other-frame)


;;隐藏和显示ecb窗口
(global-set-key [f11] 'ecb-hide-ecb-windows)
(global-set-key [S-f11] 'ecb-show-ecb-windows)



;;设置M-g为goto-line
(global-set-key (kbd "M-g") 'goto-line)

;;取消control+space键设为mark
(global-set-key (kbd "C-SPC") 'nil)

;;设置home键指向buffer开头，end键指向buffer结尾
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [end] 'end-of-buffer)
;; "C-,"设为屏幕左移命令
(global-set-key (kbd "C-,") 'scroll-left)
;; "C-."设为屏幕右移命令
(global-set-key (kbd "C-.") 'scroll-right)


;;C-z 设置标记
(global-set-key (kbd "C-z") 'set-mark-command)
;;关闭当前窗口,alt+4
(global-set-key (kbd "M-4") 'delete-window)
;;关闭其他窗口,alt+1
(global-set-key (kbd "M-1") 'delete-other-windows)
;;水平分割窗口,alt+2
(global-set-key (kbd "M-2") 'split-window-vertically)
;;垂直分割窗口,alt+3
(global-set-key (kbd "M-3") 'split-window-horizontally)
;;关闭当前缓冲区，alt+0
(global-set-key (kbd "M-0") 'kill-this-buffer)
;;显示缓冲区完整名称
(global-set-key (kbd "M-5") 'display-buffer-name)

(global-set-key (kbd "M-l" ) 'fci-mode)

;;these two functions can be used to kill buffers, but
;; I think kill-other-buffers may be more useful
;;So ,bind alt-6 to kill other buffer
(defun kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(global-set-key (kbd "M-6") 'kill-other-buffers)

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;屏蔽这个快捷键，使能中文输入法切换
(global-set-key (kbd "C-SPC") 'nil)
;;使用简单的doxymac插入文件、函数、单行、多行注释
;;按键绑定:f-->function, i-->file, s-->single, s-->multiple
(require 'doxygen)
(global-set-key (kbd "C-C d f") 'doxygen-insert-function-comment)
(global-set-key (kbd "C-C d i") 'doxygen-insert-file-comment)
(global-set-key (kbd "C-C d s") 'doxygen-insert-compound-comment)
(global-set-key (kbd "C-C d m") 'doxygen-insert-comment)

;;fast switch between dual monitors
(global-set-key (kbd "M-RET")   'other-frame)

(provide 'kbd)