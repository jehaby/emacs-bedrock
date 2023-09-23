;;; Emacs Bedrock
;;;
;;; Extra config: Vim emulation

;;; Usage: Append or require this file from init.el for bindings in Emacs.

;;; Contents:
;;;
;;;  - Core Packages

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;;   Core Packages
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Evil: vi emulation
(use-package evil
  :ensure t

  :init
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)
  (setq evil-want-keybinding nil)

  ;; Enable this if you want C-u to scroll up, more like pure Vim
  ;(setq evil-want-C-u-scroll t)

  (define-prefix-command 'evil-leader-map)

  :config
  (evil-mode)

  ;; Configuring initial major mode for some modes
  (evil-set-initial-state 'vterm-mode 'emacs)

  (evil-set-leader '(motion normal) (kbd "SPC"))
  (evil-set-leader '(motion normal) (kbd ",") 'local)

  (add-to-list 'evil-buffer-regexps '("^\\*COMMIT_EDITMSG\\*$" . insert))

  :bind
  (:map evil-leader-map
        ;; Buffer - B
        ("b q" . #'bury-buffer)
        ("b s" . #'save-buffer)
        ("b b" . #'switch-to-buffer)
        ("b o" . #'switch-to-other-buffer)
        ("b r" . #'consult-bookmark)
        ("b l" . #'consult-buffer)
        ("b p" . #'consult-projectile)
        ("b d" . #'dired)
        ("b f" . #'find-file)
        ("b k" . #'kill-this-buffer)

        ;; Editing - E
        ;; ("e c" . #'copy-whole-buffer)
        
        ;; Goto - G
        ("g l" . #'avy-goto-line)
        ("g s" . #'consult-line)
        ("g m" . #'consult-mark)
        ("g o" . #'consult-outline)

        ;; Perspecitve - P
        ;; ("p" . #'perspective-map)
	;; ("p" . #'project-prefix-map) TODO: fix

        ;; Tools - T
        ("t f" . #'auto-fill-mode)
        ("t c" . #'calendar)
        ;; ("t e" . #'eshell)
        ;; ("t l" . #'linum-mode)
        ;; ("t m" . #'notmuch)
        ("t t" . #'toggle-truncate-lines)
        ("t w" . #'toggle-word-wrap)
      ;;  ("t u" . #'undo-tree-visualize)
        )
  
  ;; (:map evil-window-map
  ;;       ("C-d" . #'toggle-window-dedicated)
  ;;       ("C-w" . #'ace-window)
  ;;       ("M-w" . #'ace-swap-window)
  ;;       ("u" . #'winner-undo))

  (:map evil-normal-state-map
        ("SPC" . evil-leader-map))

  )

;; vi keys support for other mods
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
