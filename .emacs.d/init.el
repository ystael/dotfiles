(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'default-frame-alist '(width . 100))

(setq inhibit-startup-message t)
(setq make-backup-files nil)
(global-font-lock-mode t)
(global-auto-revert-mode t)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'fundamental-mode-hook 'turn-on-auto-fill)

(require 'paredit)
(require 'midje-mode)
(require 'clojure-jump-to-file)
(add-hook 'clojure-mode-hook '(lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook 'turn-on-auto-fill)
(add-hook 'clojure-mode-hook
          '(lambda ()
             (local-set-key (kbd "RET") 'newline-and-indent)))
(add-hook 'nrepl-interaction-mode-hook '(lambda () (require 'nrepl-ritz)))
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-interaction-mode-hook '(lambda () (nrepl-ritz-break-on-exception t)))
(setq nrepl-popup-stacktraces nil)

(add-hook 'emacs-lisp-mode-hook '(lambda () (paredit-mode +1)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("." "/usr/local/share/agda/lib-0.7/src")))
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(clojure-defun-indents (quote (fact facts defmonad domonad either-case checker defhandler def-monadic-handler def-policy-handler)))
 '(coq-maths-menu-enable t)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(fill-column 95)
 '(haskell-mode-hook (quote (turn-on-haskell-indentation turn-on-font-lock turn-on-eldoc-mode turn-on-haskell-doc-mode turn-on-haskell-decl-scan)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "WhiteSmoke" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "apple" :family "Ubuntu Mono"))))
 '(agda2-highlight-datatype-face ((t (:foreground "SkyBlue2"))))
 '(agda2-highlight-field-face ((t (:foreground "MediumOrchid2"))))
 '(agda2-highlight-function-face ((t (:foreground "yellow1"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "green2"))))
 '(agda2-highlight-keyword-face ((t (:foreground "orange2"))))
 '(agda2-highlight-module-face ((t (:foreground "magenta2"))))
 '(agda2-highlight-number-face ((t (:foreground "orchid2"))))
 '(agda2-highlight-operator-face ((t (:foreground "salmon2"))))
 '(agda2-highlight-primitive-face ((t (:foreground "OliveDrab2"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "DodgerBlue2"))))
 '(agda2-highlight-record-face ((t (:foreground "SkyBlue2"))))
 '(font-lock-builtin-face ((t (:foreground "lightskyblue" :weight bold))))
 '(font-lock-comment-face ((t (:foreground "dim gray" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "orchid" :weight bold))))
 '(font-lock-doc-face ((t (:foreground "darkgray" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "#f0f000" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "steelblue" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "darkseagreen"))))
 '(font-lock-string-face ((t (:foreground "khaki"))))
 '(font-lock-type-face ((t (:foreground "orange2"))))
 '(font-lock-variable-name-face ((t (:foreground "lawn green" :weight bold))))
 '(proof-locked-face ((t (:background "gray10")))))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(load-file "/home/cjeris/.emacs.d/ProofGeneral/generic/proof-site.el")
