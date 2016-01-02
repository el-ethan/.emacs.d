;; Define keywords
(setq tenjin-keywords '("if" "in" "for" "while" "is" "not" "or" "and" "<\\?py"))
(setq tenjin-hidden-keywords '("<?py" "?>"))

;; Generate regex for keywords
(setq tenjin-keyword-regexp (regexp-opt tenjin-keywords 'words))
(setq tenjin-hidden-keywords-regexp (regexp-opt tenjin-hidden-keywords 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq tenjin-font-lock-keywords
    `(
         (,tenjin-keyword-regexp . font-lock-keyword-face)
         (,tenjin-hidden-keywords-regexp . font-lock-function-face)
         ))

(define-derived-mode tenjin-mode html-mode
  (setq font-lock-defaults '(tenjin-font-lock-keywords))
  (setq mode-name "tenjin"))

;; clear out the unneeded regex?

(provide 'tenjin-mode)
