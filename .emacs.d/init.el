(add-to-list 'load-path (locate-user-emacs-file "custom/color-theme-sanityinc-tomorrow"))

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
          '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

(use-package evil-org
  :ensure t
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-want-C-i-jump nil)

;; Enable Evil
(require 'evil)
(evil-mode 1)

(require 'color-theme-sanityinc-tomorrow)

;; (global-set-key (kbd "C-u") 'org-previous-visible-heading)
;; (global-set-key (kbd "C-d") 'org-next-visible-heading)

(define-key evil-normal-state-map (kbd "C-u") 'org-previous-visible-heading)
(define-key evil-visual-state-map (kbd "C-u") 'org-previous-visible-heading)
(define-key evil-normal-state-map (kbd "C-g") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-g") 'evil-scroll-up)

(define-key evil-normal-state-map (kbd "C-d") 'org-next-visible-heading)
(define-key evil-visual-state-map (kbd "C-d") 'org-next-visible-heading)
(define-key evil-normal-state-map (kbd "C-f") 'evil-scroll-down)
(define-key evil-visual-state-map (kbd "C-f") 'evil-scroll-down)

(define-key evil-normal-state-map (kbd "-") 'dired-jump)

(global-display-line-numbers-mode)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)

(require 'doom-modeline)
(doom-modeline-mode 1)

;; Or use this
;; Use `window-setup-hook' if the right segment is displayed incorrectly
(add-hook 'after-init-hook #'doom-modeline-mode)

(use-package org-bullets
  :ensure t
  :commands org-bullets-mode
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)


(global-set-key (kbd "M-=") 'org-do-demote)
(global-set-key (kbd "M--") 'org-do-promote)
(global-set-key (kbd "M-+") 'org-demote-subtree)
(global-set-key (kbd "M-_") 'org-promote-subtree)
(global-set-key (kbd "M->") 'org-move-subtree-down)
(global-set-key (kbd "M-<") 'org-move-subtree-up)

(global-set-key (kbd "C-c a") 'org-agenda)

(defun next-heading-evil ()
    "Next heading with auto append mode (evil)"
    (interactive)
    (org-insert-heading-respect-content)
    (evil-append-line 0)
    )
(global-set-key (kbd "C-c o") 'next-heading-evil)

(defun insert-heading-evil ()
    "Insert heading with auto append mode (evil)"
    (interactive)
    (evil-append-line 0)
    (org-meta-return)
    )
(global-set-key (kbd "C-c O") 'insert-heading-evil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#2d2d2d" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#cccccc"))
 '(beacon-color "#f2777a")
 '(custom-enabled-themes '(sanityinc-tomorrow-eighties-rp))
 '(custom-safe-themes
   '("86ac583d53a4333cc0b8dfce1f569f028f2189976f1313b055457a6bb25218a5" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(org-agenda-files '("~/develop/organize/org/learn.org"))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
