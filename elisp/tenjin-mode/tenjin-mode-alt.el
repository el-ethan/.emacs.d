(defvar tenjin-mode-hook nil)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . tenjin-mode))
(add-to-list 'auto-mode-alist '("\\.pyhtml\\'" . tenjin-mode))

(defvar tenjin-py-statements
  '("<?py "
    " ?>"))

(defvar tenjin-py-keywords
  '("if" "is" "any" "is"))

;; I'd probably put in a default that you want, as opposed to nil
(defvar tenjin-tab-width 4 "Width of a tab for MYDSL mode")

;; Two small edits.
;; First is to put an extra set of parens () around the list
;; which is the format that font-lock-defaults wants
;; Second, you used ' (quote) at the outermost level where you wanted ` (backquote)
;; you were very close
(defvar mydsl-font-lock-defaults
  `((
       ;; stuff between "
       ("\"\\.\\*\\?" . font-lock-string-face)
       ;; ; : , ; { } =>  @ $ = are all special elements
       (":\\|,\\|;\\|{\\|}\\|=>\\|@\\|$\\|=" . font-lock-keyword-face)
       ( ,(regexp-opt tenjin-py-statements 'words) . font-lock-comment-face)
       ( ,(tenjin-py-keywords 'words) . font-lock-constant-face)
       )))
  
(define-derived-mode tenjin-mode python-mode "py-tenjin"
  "MYDSL mode is a major mode for editing MYDSL  files"
