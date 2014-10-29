;;使用简单的doxymac插入文件、函数、单行、多行注释
;;按键绑定:f-->function, i-->file, s-->single, s-->multiple
(require 'doxygen)
(global-set-key (kbd "C-C d f") 'doxygen-insert-function-comment)
(global-set-key (kbd "C-C d i") 'doxygen-insert-file-comment)
(global-set-key (kbd "C-C d s") 'doxygen-insert-compound-comment)
(global-set-key (kbd "C-C d m") 'doxygen-insert-comment)

(provide 'init-doxygen)
