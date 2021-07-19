(require 'package)
(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
(add-to-list 'package-archives '("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/"))
(add-to-list 'package-archives '("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (toml-mode racer flycheck-rust cargo rust-mode company cnfonts))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(package-initialize)
 

;(require 'evil)
;(evil-mode 1)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; rust
;; Enable company globally for all mode
(global-company-mode)
;; Reduce the time after which the company auto completion popup opens
;(setq company-idle-delay 0.2)
;; Reduce the number of characters before company kicks in
(setq company-minimum-prefix-length 1)
; rust-mode
(setq auto-mode-alist
      (append
       '(("\\.rs\\'" . rust-mode))
       auto-mode-alist))
; cargo
(add-hook 'rust-mode-hook 'cargo-minor-mode)
; flycheck-rust
(add-hook 'rust-mode-hook #'flycheck-rust-setup)
;  rust-fmt
;(define-key rust-mode-map (kbd "C-c C-f") #'rust-format-buffer)
(local-set-key  (kbd "C-c C-f")#'rust-format-buffer)
; rust racer
(setq racer-rust-src-path (expand-file-name "~/rustc-nightly-src/library"))
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)
;Key binding to jump to method definition
(local-set-key (kbd "M-.")#'racer-find-definition)
;;Key binding to auto complete and indent
(local-set-key (kbd "TAB")#'racer-complete-or-indent)
;(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
;Setting up configurations when you load rust-mode
(add-hook 'rust-mode-hook
     '(lambda()
;;Enable racer
(racer-activate)
;;Hookin racer with eldoc to provide documentation
(racer-turn-on-eldoc)
; toml-mode
(add-hook 'toml-mode-hook 'company-mode)
;; rust
