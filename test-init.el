;; Test init file to run bits of configuration in isolation.
;; Run with `'emacs -Q -l ~/.emacs.d/test-init.el`'

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(global-auto-complete-mode t)
