(require 'package)
(add-to-list 'package-archives '("gnu"   . "http://elpa.emacs-china.org/gnu/"))
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(flycheck evil key-chord)
  "These are my packages.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(cond
 ((string-equal system-type "darwin")
  (when (not (package-installed-p 'exec-path-from-shell))
    (package-install 'exec-path-from-shell))))

(require 'key-chord)
(require 'evil)
(require 'flycheck)

(setq key-chord-two-keys-delay 0.1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode t)
(evil-mode 0)
(global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;; show line number
(global-linum-mode 1)

;; close welcome windows
(setq inhibit-splash-screen 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck key-chord evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
