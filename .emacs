;--- Package Management -----------------------------------------------------------------;

(require 'package)
(add-to-list 'package-archives '("org" , "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("melpa-stable" , "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin/" ":"

 (getenv "PATH")))

(setq exec-path (append exec-path '("/usr/local/bin")))

(setq exec-path (append exec-path '("/usr/local/Cellar")))

;; (dolist (hook '(text-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode 1))))
;; (setq ispell-program-name "/usr/local/Cellar/ispell/3.3.02/bin/ispell")


;--- Appearance -------------------------------------------------------------------------;

;; disable toolbar and menubar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Font
(set-face-attribute 'default nil
                    :family "Inconsolata" ; Inconsolata is ♥
                    :height 120
                    :weight 'normal
                    :width 'normal)

;; text scaling
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Themes
(if (display-graphic-p) 
    (load-theme 'flatland t)
  (load-theme 'zenburn))
(setq custom-safe-themes t)

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Line numbers
(global-linum-mode 1)

;; Visual Line mode
(global-visual-line-mode 1)


;--- smex ------------------------------------------------------------------------------;

(require 'smex)
(smex-initialize)
;; smex keybinding
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;--- General ---------------------------------------------------------------------------;

;; switching windows
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; Unbinding C-z
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])
(global-set-key [(control z)] 'undo)

;; Sloppy hands!
(global-unset-key [(control x)(control c)])


;--- General Programming ---------------------------------------------------------------;

;; comment region
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)


;--- TeX -------------------------------------------------------------------------------;

;; TeX
(require 'cl)

;; LaTeX
(require 'latex)
(add-hook 'LaTeX-mode-hook #'flyspell-mode)
(add-hook 'LaTeX-mode-hook #'auto-complete-mode)
(add-hook 'LaTeX-mode-hook #'latex-math-mode)
(setq TeX-save-query nil)
(define-key LaTeX-mode-map (kbd "S-<return>") 'TeX-command-run-all)

;; LaTeX shortcuts
(define-key LaTeX-mode-map (kbd "C-c f") 'LaTeX-math-frac)
(define-key LaTeX-mode-map (kbd "C-c z") "\\mathbb{Z}")
(define-key LaTeX-mode-map (kbd "C-c n") "\\mathbb{N}")
(define-key LaTeX-mode-map (kbd "C-c r") "\\mathbb{R}")
(define-key LaTeX-mode-map (kbd "C-c c") "\\mathbb{C}")
(define-key LaTeX-mode-map (kbd "C-c i") 'LaTeX-math-implies)
(define-key LaTeX-mode-map (kbd "C-c a") 'LaTeX-math-forall)
(define-key LaTeX-mode-map (kbd "C-c e") 'LaTeX-math-exists)
(define-key LaTeX-mode-map (kbd "` 2") "^{2}")
(define-key LaTeX-mode-map (kbd "` 3") "^{3}")
(define-key LaTeX-mode-map (kbd "` T") 'LaTeX-math-dagger)
(define-key LaTeX-mode-map (kbd "C-c d") "\\frac{dy}{dx}")
(define-key LaTeX-mode-map (kbd "C-c m") "\\lim_{n \\rightarrow \infty}")
(define-key LaTeX-mode-map (kbd "C-c h") "\\lim_{h \\rightarrow 0}")
(define-key LaTeX-mode-map (kbd "C-c (") "\\left(")
(define-key LaTeX-mode-map (kbd "C-c {") "\\left\{")
(define-key LaTeX-mode-map (kbd "C-c [") "\\left[")
(define-key LaTeX-mode-map (kbd "C-c 0") "_{0}")
(define-key LaTeX-mode-map (kbd "C-c q") "\\hfill \\ensuremath \\square")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
 '(package-selected-packages
   (quote
    (flatland-theme markdown-mode+ markdown-mode smartparens auctex-latexmk latex-math-preview latex-extra powerline dracula-theme zenburn-theme smex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
