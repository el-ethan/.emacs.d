;;; tenjin-mode.el --- A major mode for tenjin

;; Copyright (C) 2015 Ethan Skinner

;; Author: Ethan Skinner
;; Version: 0.1

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;   This is an emacs major mode for tenjin with:
;;        syntax highlighting
;;        sgml/html integration
;;        indentation (working with sgml)
;;        more to come

;; This file comes from 

;;; Code:

(require 'sgml-mode)

(defgroup tenjin nil
  "Major mode for editing tenjin code."
  :prefix "tenjin-"
  :group 'languages)

(defcustom tenjin-user-keywords nil
  "Custom keyword names"
  :type '(repeat string)
  :group 'tenjin)

(defcustom tenjin-user-functions nil
  "Custom function names"
  :type '(repeat string)
  :group 'tenjin)

;; (defcustom tenjin-debug nil
;;   "Log indentation logic"
;;   :type 'boolean
;;   :group 'tenjin)

(defun tenjin-closing-keywords ()
  (append
   tenjin-user-keywords
   '("if" "for" "block" "filter" "with"
     "raw" "macro" "autoescape" "trans" "call")))

(defun tenjin-indenting-keywords ()
  (append
   (tenjin-closing-keywords)
   '("else" "elif")))

(defun tenjin-builtin-keywords ()
  '("as" "in" "elif" "False" "True" "None"
    "break" "continue" "is" "not" "or" "and"
    "set" "from" "import" "with" "for" "pass"
    "while"))

(defun tenjin-functions-keywords ()
  (append
   tenjin-user-functions
   '("print" "str" "format")))

(defun tenjin-find-open-tag ()
  (if (search-backward-regexp
       (rx-to-string
        `(and "<?py"
              (* whitespace)
              (? (group
                  "end"))
              (group
               ,(append '(or)
                        (tenjin-closing-keywords)
                        ))
              (group
               (*? anything))
              (* whitespace)
              (? "-")
              "?>")) nil t)
      (if (match-string 1) ;; End tag, going on
          (let ((matches (tenjin-find-open-tag)))
            (if (string= (car matches) (match-string 2))
                (tenjin-find-open-tag)
              (list (match-string 2) (match-string 3))))
        (list (match-string 2) (match-string 3)))
    nil))

(defun tenjin-close-tag ()
  "Close the previously opened template tag."
  (interactive)
  (let ((open-tag (save-excursion (tenjin-find-open-tag))))
    (if open-tag
        (insert
         (if (string= (car open-tag) "block")
             (format "<?py #end%s%s %?>"
                     (car open-tag)(nth 1 open-tag))
           (format "<?py% #end%s %?>"
                   (match-string 2))))
      (error "Nothing to close")))
  (save-excursion (tenjin-indent-line)))

(defun tenjin-insert-tag ()
  "Insert an empty tag"
  (interactive)
  (insert "<?py ")
  (save-excursion
    (insert " ?>")
    (tenjin-indent-line)))

(defun tenjin-insert-var ()
  "Insert an empty tag"
  (interactive)
  (insert "${")
  (save-excursion
    (insert "}")
    (tenjin-indent-line)))

(defun tenjin-insert-comment ()
  "Insert an empty tag"
  (interactive)
  (insert "<!--")
  (save-excursion
    (insert "-->")
    (tenjin-indent-line)))

(defconst tenjin-font-lock-comments
  `(
    (,(rx "<!--"
          (* whitespace)
          (group
           (*? anything)
           )
          (* whitespace)
          "-->")
     . (1 font-lock-comment-face t))))

(defconst tenjin-font-lock-keywords-1
  (append
   tenjin-font-lock-comments
   sgml-font-lock-keywords-1))

(defconst tenjin-font-lock-keywords-2
  (append
   tenjin-font-lock-keywords-1
   sgml-font-lock-keywords-2))

(defconst tenjin-font-lock-keywords-3
  (append
   tenjin-font-lock-keywords-1
   tenjin-font-lock-keywords-2
   `(
     (,(rx "${"
           (* whitespace)
           (group
            (*? anything)
            )
           (*
            "|" (* whitespace) (*? anything))
           (* whitespace)
           "}") (1 font-lock-variable-name-face t))
     (,(rx  (group "|" (* whitespace))
            (group (+ word))
            )
      (1 font-lock-keyword-face t)
      (2 font-lock-warning-face t))
     (,(rx-to-string `(and (group "|" (* whitespace))
                           (group
                            ,(append '(or)
                                     (tenjin-functions-keywords)
                                     ))))
      (1 font-lock-keyword-face t)
      (2 font-lock-function-name-face t)
      )
     (,(rx-to-string `(and word-start
                           (? "end")
                           ,(append '(or)
                                    (tenjin-indenting-keywords)
                                    )
                           word-end)) (0 font-lock-keyword-face))
     (,(rx-to-string `(and word-start
                           ,(append '(or)
                                    (tenjin-builtin-keywords)
                                    )
                           word-end)) (0 font-lock-builtin-face))

     (,(rx (or "<?py" "?>")) (0 font-lock-function-name-face t))
     (,(rx (or "${" "#{" "}" "{=" "{==" "==}" "=}")) (0 font-lock-type-face t))
     (,(rx "<!--"
           (* whitespace)
           (group
            (*? anything)
            )
           (* whitespace)
           "-->")
      (1 font-lock-comment-face t))
     (,(rx (or "<!--" "-->")) (0 font-lock-comment-delimiter-face t))
     )))

(defvar tenjin-font-lock-keywords
  tenjin-font-lock-keywords-1)

(defun sgml-indent-line-num ()
  "Indent the current line as SGML."
  (let* ((savep (point))
         (indent-col
          (save-excursion
            (back-to-indentation)
            (if (>= (point) savep) (setq savep nil))
            (sgml-calculate-indent))))
    (if (null indent-col)
        0
      (if savep
          (save-excursion indent-col)
        indent-col))))

(defun tenjin-calculate-indent-backward (default)
  "Return indent column based on previous lines"
  (let ((indent-width sgml-basic-offset) (default (sgml-indent-line-num)))
    (forward-line -1)
    (if (looking-at "^[ \t]*<?py-? *end") ; Don't indent after end
        (current-indentation)
      (if (looking-at (concat "^[ \t]*<?py-? *.*?<?py-? *end" (regexp-opt (tenjin-indenting-keywords))))
          (current-indentation)
        (if (looking-at (concat "^[ \t]*<?py-? *" (regexp-opt (tenjin-indenting-keywords)))) ; Check start tag
            (+ (current-indentation) indent-width)
          (if (looking-at "^[ \t]*<") ; Assume sgml block trust sgml
              default
            (if (bobp)
                0
              (tenjin-calculate-indent-backward default))))))))


(defun tenjin-calculate-indent ()
  "Return indent column"
  (if (bobp)  ; Check begining of buffer
      0
    (let ((indent-width sgml-basic-offset) (default (sgml-indent-line-num)))
      (if (looking-at "^[ \t]*<?py-? *e\\(nd\\|lse\\|lif\\)") ; Check close tag
          (save-excursion
            (forward-line -1)
            (if
                (and
                 (looking-at (concat "^[ \t]*<?py-? *" (regexp-opt (tenjin-indenting-keywords))))
                 (not (looking-at (concat "^[ \t]*<?py-? *.*?<?py *end" (regexp-opt (tenjin-indenting-keywords))))))
                (current-indentation)
              (- (current-indentation) indent-width)))
        (if (looking-at "^[ \t]*</") ; Assume sgml end block trust sgml
            default
          (save-excursion
            (tenjin-calculate-indent-backward default)))))))

(defun tenjin-indent-line ()
  "Indent current line as Jinja code"
  (interactive)
  (let ((old_indent (current-indentation)) (old_point (point)))
    (move-beginning-of-line nil)
    (let ((indent (max 0 (tenjin-calculate-indent))))
      (indent-line-to indent)
      (if (< old_indent (- old_point (line-beginning-position)))
          (goto-char (+ (- indent old_indent) old_point)))
      indent)))


;;;###autoload
(define-derived-mode tenjin-mode html-mode  "Tenjin"
  "Major mode for editing tenjin files"
  :group 'tenjin
  ;; Disabling this because of this emacs bug: 
  ;;  http://lists.gnu.org/archive/html/bug-gnu-emacs/2002-09/msg00041.html
  ;; (modify-syntax-entry ?\'  "\"" sgml-mode-syntax-table)
  (set (make-local-variable 'comment-start) "{#")
  (set (make-local-variable 'comment-start-skip) "{#")
  (set (make-local-variable 'comment-end) "#}")
  (set (make-local-variable 'comment-end-skip) "#}")
  ;; it mainly from sgml-mode font lock setting
  (set (make-local-variable 'font-lock-defaults)
       '((
          tenjin-font-lock-keywords
          tenjin-font-lock-keywords-1
          tenjin-font-lock-keywords-2
          tenjin-font-lock-keywords-3)
         nil t nil nil
         (font-lock-syntactic-keywords
          . sgml-font-lock-syntactic-keywords)))
  (set (make-local-variable 'indent-line-function) 'tenjin-indent-line))

(define-key tenjin-mode-map (kbd "C-c c") 'tenjin-close-tag)
(define-key tenjin-mode-map (kbd "C-c t") 'tenjin-insert-tag)
(define-key tenjin-mode-map (kbd "C-c v") 'tenjin-insert-var)
(define-key tenjin-mode-map (kbd "C-c #") 'tenjin-insert-comment)

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.tenjin\\'" . tenjin-mode))

(provide 'tenjin-mode)

;;; tenjin-mode.el ends here
