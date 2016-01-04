;; Define keywords
(setq tenjin-keywords '("if" "else" "elif" "in" "for" "while" "is" "not" "or" "and"))

;; Generate regex for keywords
(setq tenjin-keyword-regexp (regexp-opt tenjin-keywords 'words))

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq tenjin-font-lock-keywords
    `((,tenjin-keyword-regexp . font-lock-keyword-face)
      ("\\?>\\|<\\?py" . font-lock-comment-face)
      ("\\${\\|}" . font-lock-constant-face)
      ("'.*?'" . font-lock-string-face)
      ("#endfor\\|#endif" . font-lock-type-face)
         ))

(define-derived-mode tenjin-mode yaml-mode
  (setq font-lock-defaults '(tenjin-font-lock-keywords))
  (setq mode-name "tenjin"))

;; clear out the unneeded regex?
(setq tenjin-keywords nil)
(setq tenjin-keywords-regexp nil)

(provide 'tenjin-mode)
