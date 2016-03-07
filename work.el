
;; Stuff related to work
(setq sql-mysql-login-params
      '((user :default "root")
        (database :default "aeris2")
	(password :default "")
        (server :default "localhost")))

(setq-default fill-column 120)
(setq gud-chdir-before-run nil)
;; (defadvice
;;     pdb
;;     (before (lambda () (cd "/home/ethan/git/aeris2") activate)))
;; (add-hook 'gud-mode-hook (lambda () (cd "/home/ethan/git/aeris2")))
;;
;; Set PYTHONPATH for aeris project

(defun es/setup-debugger ()
    (setenv "PYTHONPATH" "/home/ethan/git/aeris2:/home/ethan/git/kivy:/home/ethan/git/gryphus:/home/ethan/git/ee-sentinel:/home/ethan/git/ee-updater")
    (cd "/home/ethan/git/aeris2"))

(defun es/pdb ()
    (interactive)
    (es/setup-debugger)
    (pdb "pdb ~/git/aeris2/aeris2/__main__.py"))

;; (advice-add 'gud-mode :before #'es/setup-debugger)

;; (setenv "PYTHONPATH" "/home/ethan/git/aeris2:/home/ethan/git/kivy:/home/ethan/git/gryphus:/home/ethan/git/ee-sentinel:/home/ethan/git/ee-updater")
