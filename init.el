(require 'package)
(add-to-list 'package-archives '("gnu"   . "http://elpa.emacs-china.org/gnu/"))
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(flycheck seq company)
  "These are my packages.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(cond
 ((string-equal system-type "darwin")
  (when (not (package-installed-p 'exec-path-from-shell))
    (package-install 'exec-path-from-shell))))

(require 'flycheck)

(global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; show line number
(global-linum-mode 1)

;; set cursor-type
(setq-default cursor-type 'bar)

;; close welcome windows
(setq inhibit-splash-screen 1)

;; set tab width 4 for c-basic
(setq-default c-basic-offset 4
	      c-default-style "linux")
(setq-default tab-width 4)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
