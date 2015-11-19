(deftheme material
  "Created 2015-11-17.")

(custom-theme-set-variables
 'material
 '(fci-rule-color "#37474f")
 '(ansi-color-names-vector ["#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"])
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold]))

(custom-theme-set-faces
 'material
 '(bold ((((class color) (min-colors 89)) (:weight bold))))
 '(bold-italic ((((class color) (min-colors 89)) (:slant italic :weight bold))))
 '(underline ((((class color) (min-colors 89)) (:underline t))))
 '(italic ((((class color) (min-colors 89)) (:slant italic))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#ff8A65"))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(font-lock-doc-face ((((class color) (min-colors 89)) (:foreground "moccasin"))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#84ffff"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#fff59d"))))
 '(font-lock-negation-char-face ((((class color) (min-colors 89)) (:foreground "#4dd0e1"))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 89)) (:foreground "gold"))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 89)) (:foreground "#fff59d"))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 89)) (:foreground "#b39ddb"))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#9ccc65"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#84ffff"))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#ffcc80"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:weight bold :foreground "#f36c60"))))
 '(shadow ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(success ((((class color) (min-colors 89)) (:foreground "SeaGreen2"))))
 '(error ((((class color) (min-colors 89)) (:foreground "#f36c60"))))
 '(warning ((((class color) (min-colors 89)) (:foreground "#ff9800"))))
 '(highlight-indentation-face ((((class color) (min-colors 89)) (:background "#37474f"))))
 '(highlight-indentation-current-column-face ((((class color) (min-colors 89)) (:background "#1c1f26"))))
 '(flymake-warnline ((((class color) (min-colors 89)) (:underline (:style wave :color "#ff9800") :background "#263238"))))
 '(flymake-errline ((((class color) (min-colors 89)) (:underline (:style wave :color "#f36c60") :background "#263238"))))
 '(match ((((class color) (min-colors 89)) (:foreground "#263238" :background "#8bc34a" :inverse-video nil))))
 '(isearch ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#8bc34a"))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:foreground "#263238" :background "#8bc34a" :inverse-video nil))))
 '(isearch-fail ((((class color) (min-colors 89)) (:background "#263238" :inherit font-lock-warning-face :inverse-video t))))
 '(ido-subdir ((((class color) (min-colors 89)) (:foreground "#b39ddb"))))
 '(ido-first-match ((((class color) (min-colors 89)) (:foreground "#ff9800"))))
 '(ido-only-match ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(ido-indicator ((((class color) (min-colors 89)) (:foreground "#f36c60" :background "#263238"))))
 '(ido-virtual ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(cursor ((((class color) (min-colors 89)) (:background "#ff9800"))))
 '(fringe ((((class color) (min-colors 89)) (:background "#263238"))))
 '(border ((((class color) (min-colors 89)) (:background "#37474f"))))
 '(highlight ((((class color) (min-colors 89)) (:inverse-video nil :background "#37474f"))))
 '(mode-line ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#1c1f26"))))
 '(mode-line-buffer-id ((((class color) (min-colors 89)) (:foreground "#ffffff" :background nil))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:inherit mode-line :foreground "#a7adba" :background "#1c1f26" :weight normal :box nil))))
 '(mode-line-emphasis ((((class color) (min-colors 89)) (:foreground "#ffffff" :slant italic))))
 '(mode-line-highlight ((((class color) (min-colors 89)) (:foreground "#b39ddb" :box nil))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:foreground "#4dd0e1"))))
 '(region ((((class color) (min-colors 89)) (:background "#555555"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#bf616a"))))
 '(header-line ((((class color) (min-colors 89)) (:inherit mode-line :foreground "#b39ddb" :background nil))))
 '(trailing-whitespace ((((class color) (min-colors 89)) (:foreground "#f36c60" :inverse-video t :underline nil))))
 '(show-paren-match ((((class color) (min-colors 89)) (:background "#81d4fa" :foreground "black"))))
 '(show-paren-mismatch ((((class color) (min-colors 89)) (:background "red1" :foreground "white"))))
 '(eldoc-highlight-function-argument ((((class color) (min-colors 89)) (:foreground "#8bc34a" :weight bold))))
 '(git-gutter:modified ((((class color) (min-colors 89)) (:foreground "#b39ddb" :weight bold))))
 '(git-gutter:added ((((class color) (min-colors 89)) (:foreground "#8bc34a" :weight bold))))
 '(git-gutter:deleted ((((class color) (min-colors 89)) (:foreground "#f36c60" :weight bold))))
 '(git-gutter:unchanged ((((class color) (min-colors 89)) (:background "#fff59d"))))
 '(link ((((class color) (min-colors 89)) (:foreground nil :underline t))))
 '(widget-button ((((class color) (min-colors 89)) (:underline t :weight bold))))
 '(widget-field ((((class color) (min-colors 89)) (:background "#37474f" :box (:line-width 1 :color "#ffffff")))))
 '(compilation-column-number ((((class color) (min-colors 89)) (:foreground "#fff59d"))))
 '(compilation-line-number ((((class color) (min-colors 89)) (:foreground "#fff59d"))))
 '(compilation-mode-line-exit ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(compilation-mode-line-fail ((((class color) (min-colors 89)) (:foreground "#f36c60"))))
 '(compilation-mode-line-run ((((class color) (min-colors 89)) (:foreground "#4dd0e1"))))
 '(helm-header ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#263238"))))
 '(helm-match ((((class color) (min-colors 89)) (:foreground "gold1"))))
 '(helm-selection ((((class color) (min-colors 89)) (:background "#37474f"))))
 '(helm-ff-file ((((class color) (min-colors 89)) (:foreground "#ffffff"))))
 '(helm-ff-directory ((((class color) (min-colors 89)) (:foreground "#81d4fa"))))
 '(helm-ff-executable ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(helm-buffer-directory ((((class color) (min-colors 89)) (:foreground "#81d4fa"))))
 '(helm-buffer-file ((((class color) (min-colors 89)) (:foreground "#ffffff"))))
 '(helm-grep-file ((((class color) (min-colors 89)) (:foreground "#81d4fa" :underline t))))
 '(helm-buffer-process ((((class color) (min-colors 89)) (:foreground "#f36c60"))))
 '(helm-buffer-not-saved ((((class color) (min-colors 89)) (:foreground "#ff9800"))))
 '(helm-candidate-number ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#ef6c00"))))
 '(helm-source-header ((((class color) (min-colors 89)) (:background "#455A64" :foreground "#eceff1" :height 1.3 :bold t))))
 '(org-agenda-structure ((((class color) (min-colors 89)) (:foreground "#81d4fa" :bold t))))
 '(org-agenda-date ((((class color) (min-colors 89)) (:foreground "#4dd0e1" :underline nil))))
 '(org-agenda-done ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(org-agenda-dimmed-todo-face ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(org-block ((((class color) (min-colors 89)) (:foreground "#8bc34a" :background "#1c1f26"))))
 '(org-block-background ((t (:background "#1c1f26"))))
 '(org-code ((((class color) (min-colors 89)) (:foreground "#8bc34a" :background "#1c1f26"))))
 '(org-column ((((class color) (min-colors 89)) (:background "#37474f"))))
 '(org-column-title ((((class color) (min-colors 89)) (:inherit org-column :weight bold :underline t))))
 '(org-date ((((class color) (min-colors 89)) (:foreground "#80cbc4" :underline t))))
 '(org-document-info ((((class color) (min-colors 89)) (:foreground "#81d4fa" :height 1.35))))
 '(org-document-info-keyword ((((class color) (min-colors 89)) (:foreground "#8bc34a" :height 1.35))))
 '(org-document-title ((((class color) (min-colors 89)) (:weight bold :foreground "#ffffff" :height 1.35))))
 '(org-done ((((class color) (min-colors 89)) (:foreground "#8bc34a" :bold t :background "#1b5e20"))))
 '(org-ellipsis ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(org-footnote ((((class color) (min-colors 89)) (:foreground "#81d4fa"))))
 '(org-formula ((((class color) (min-colors 89)) (:foreground "#f36c60"))))
 '(org-hide ((((class color) (min-colors 89)) (:foreground "#263238" :background "#263238"))))
 '(org-link ((((class color) (min-colors 89)) (:foreground "#4dd0e1" :underline t))))
 '(org-scheduled ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(org-scheduled-previously ((((class color) (min-colors 89)) (:foreground "#ff9800"))))
 '(org-scheduled-today ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(org-special-keyword ((((class color) (min-colors 89)) (:foreground "#b0bec5"))))
 '(org-table ((((class color) (min-colors 89)) (:foreground "#e3f2fd" :background "#1c1f26"))))
 '(org-todo ((((class color) (min-colors 89)) (:foreground "#ffab91" :bold t :background "#dd2c00"))))
 '(org-upcoming-deadline ((((class color) (min-colors 89)) (:foreground "#ff9800"))))
 '(org-warning ((((class color) (min-colors 89)) (:weight bold :foreground "#f36c60"))))
 '(org-block-begin-line ((((class color) (min-colors 89)) (:foreground "#b3e5fc" :background "#1e2930" :underline "#e1f5fe"))))
 '(org-block-end-line ((((class color) (min-colors 89)) (:foreground "#b3e5fc" :background "#1e2930" :overline "#e1f5fe"))))
 '(org-level-1 ((((class color) (min-colors 89)) (:inherit outline-1 :overline "#b0bec5" :background "#455A64" :weight bold :height 1.3))))
 '(org-level-2 ((((class color) (min-colors 89)) (:inherit outline-2 :background "#35575b" :overline "#65757e" :height 1.2))))
 '(org-level-3 ((((class color) (min-colors 89)) (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((((class color) (min-colors 89)) (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((((class color) (min-colors 89)) (:inherit outline-5))))
 '(org-level-6 ((((class color) (min-colors 89)) (:inherit outline-6))))
 '(org-level-7 ((((class color) (min-colors 89)) (:inherit outline-7))))
 '(org-level-8 ((((class color) (min-colors 89)) (:inherit outline-8))))
 '(company-preview-common ((((class color) (min-colors 89)) (:foreground "#C0C0C0" :background "#FFFFD7"))))
 '(company-scrollbar-bg ((((class color) (min-colors 89)) (:background "#F0F0F0"))))
 '(company-scrollbar-fg ((((class color) (min-colors 89)) (:background "#C0C0C0"))))
 '(company-tooltip ((((class color) (min-colors 89)) (:weight bold :foreground "#1c1f26" :background "#78909c"))))
 '(company-tooltip-annotation ((((class color) (min-colors 89)) (:weight normal :foreground "#b0bec5" :background "#78909c"))))
 '(company-tooltip-common ((((class color) (min-colors 89)) (:weight normal :inherit company-tooltip))))
 '(company-tooltip-common-selection ((((class color) (min-colors 89)) (:weight normal :inherit company-tooltip-selection))))
 '(company-tooltip-selection ((((class color) (min-colors 89)) (:weight bold :foreground "#ffffff" :background "#37474f"))))
 '(outline-1 ((((class color) (min-colors 89)) (:inherit nil :foreground "#eceff1"))))
 '(outline-2 ((((class color) (min-colors 89)) (:inherit nil :foreground "#e1f5fe"))))
 '(outline-3 ((((class color) (min-colors 89)) (:inherit nil :foreground "#a5d6a7"))))
 '(outline-4 ((((class color) (min-colors 89)) (:inherit nil :foreground "#ffcc80"))))
 '(outline-5 ((((class color) (min-colors 89)) (:inherit nil :foreground "#b3e5fc"))))
 '(outline-6 ((((class color) (min-colors 89)) (:inherit nil :foreground "CadetBlue1"))))
 '(outline-7 ((((class color) (min-colors 89)) (:inherit nil :foreground "aquamarine1"))))
 '(outline-8 ((((class color) (min-colors 89)) (:inherit nil :foreground "#b39ddb"))))
 '(custom-variable-tag ((((class color) (min-colors 89)) (:foreground "#4dd0e1"))))
 '(custom-group-tag ((((class color) (min-colors 89)) (:foreground "#4dd0e1"))))
 '(custom-state ((((class color) (min-colors 89)) (:foreground "#8bc34a"))))
 '(default ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#263238")))))

(provide-theme 'material)
