(require 'package)
(add-to-list 'package-archives '("gnu"   . "http://elpa.emacs-china.org/gnu/"))
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(flycheck seq company evil key-chord)
  "These are my packages.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(cond
 ((string-equal system-type "darwin")
  (when (not (package-installed-p 'exec-path-from-shell))
    (package-install 'exec-path-from-shell))))

(require 'flycheck)
(require 'evil)
(require 'key-chord)

(setq key-chord-two-keys-delay 0.1)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode t)
(evil-mode t)

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
(setq-default tab-width 4
	      indent-tabs-mode nil)

;; enable bracket complete
(electric-pair-mode t)
