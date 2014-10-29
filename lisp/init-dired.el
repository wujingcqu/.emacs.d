(require-package 'dired+)
(require-package 'dired-sort)

(setq-default diredp-hide-details-initially-flag nil
              dired-dwim-target t)

(after-load 'dired
  (require 'dired+)
  (require 'dired-sort)
  (when (fboundp 'global-dired-hide-details-mode)
    (global-dired-hide-details-mode -1))
  (setq dired-recursive-deletes 'top)
  (setq dired-recursive-copies 'always)    ;recursively copy/delete directories
  (setq find-ls-option '("-print0 | xargs -0 ls -alhd" . ""))
  (setq dired-listing-switches "-alh")  ;output human readable file sizes
  (define-key dired-mode-map [mouse-2] 'dired-find-file)
  (add-hook 'dired-mode-hook
            (lambda () (guide-key/add-local-guide-key-sequence "%"))))

;;; ------------------------------------------------------
;;; ------------------------------------------------------
;; Basic commands for dired mode
;; q close the file
;; m mark a file
;; u unmark
;; U unmark all marked
;; % m mark by patter (regex)
;; C Copy file
;; R Rename/move file
;; D Delete file
;; + create a new dir
;; Z compress/decompress the file by gzip
;; g refresh dir listing
;; ^ go to parent dir

(provide 'init-dired)
