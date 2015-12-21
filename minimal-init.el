;; Minimal configuration for editing commit messages, etc.
(add-to-list 'auto-mode-alist '("\\COMMIT_EDITMSG\\'" . text-mode))
(load-theme 'misterioso t)
(column-number-mode)
(flyspell-mode)
(add-hook 'text-mode-hook 'flyspell-mode)

