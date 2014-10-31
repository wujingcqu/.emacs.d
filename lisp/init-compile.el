(setq-default compile-command "make")

;;  C-f7, 设置编译命令; f7, 保存所有文件然后编译当前窗口文件
(defun du-onekey-compile ()
  "Save buffers and start compile"
  (interactive)
  (save-some-buffers t)
  (compile compile-command)
  (switch-to-buffer-other-window "*compilation*"))


(global-set-key [f7] 'du-onekey-compile)


(provide 'init-compile)
