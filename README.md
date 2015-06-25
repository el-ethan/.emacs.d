# My Emacs configuration.

Much of what is in here is copied from other more talented Emacs users, but feel free to take what you like for your own config. 

I keep most of my settings in settings.org which is loaded using the following code from my .emacs file in my home directory.

    ;; Load configuration from ~/.emacs.d/settings.org
    (require 'org)
    (org-babel-load-file
    (expand-file-name "settings.org"
                       user-emacs-directory))


