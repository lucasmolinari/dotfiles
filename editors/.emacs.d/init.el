;;; -*- lexical-binding: t; -*-

'lkqjwe'
"iklqwjeqw"
(setq custom-file "~/.emacs.d/custom.el")

(setq inhibit-startup-message t
      make-backup-files nil
      auto-save-default nil
      ring-bell-function 'ignore
	  use-dialog-box nil)
(setopt use-short-answers t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(electric-pair-mode)
(global-font-lock-mode)
(save-place-mode)
(savehist-mode)

(global-auto-revert-mode) ;; refresh files changed on disk
(setq global-auto-revert-non-file-buffers t)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq-default tab-width 4)

(set-frame-font "JetBrains Mono NF-12" nil t)

(recentf-mode)
(add-hook 'emacs-startup-hook #'recentf-open-files)

;; Packages
(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :init
  (setq evil-want-C-u-scroll t
		evil-want-keybinding nil
		evil-undo-system 'undo-redo)
  :config
  (evil-mode)
  (define-key evil-normal-state-map (kbd "M-h") #'windmove-left)
  (define-key evil-normal-state-map (kbd "M-j") #'windmove-down)
  (define-key evil-normal-state-map (kbd "M-k") #'windmove-up)
  (define-key evil-normal-state-map (kbd "M-l") #'windmove-right))

;; use 'q' to select single and double quotes
(with-eval-after-load 'evil
  (evil-define-text-object my/evil-inner-quote (count &optional beg end type)
    (save-excursion
      (let ((pt (point))
            (re "\"\\(?:\\\\.\\|[^\"\\\\\n]\\)*\"\\|'\\(?:\\\\.\\|[^'\\\\\n]\\)*'")
            result)
        (beginning-of-line)
        (while (and (not result) (re-search-forward re nil t))
          (when (< pt (match-end 0))
            (setq result (list (1+ (match-beginning 0))
                               (1- (match-end 0))))))
        (or result (user-error "No quoted string found")))))
  (define-key evil-inner-text-objects-map "q" #'my/evil-inner-quote))
;; end

(setq completion-category-defaults nil
      completion-pcm-leading-wildcard t)

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init)
)

(use-package vertico
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles partial-completion)))))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package consult
  :bind
  (("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)
   ("M-s g" . consult-grep)))

(use-package magit)

(use-package which-key
  :init
  (which-key-mode))

(use-package evil-nerd-commenter
  :after evil
  :bind (:map evil-normal-state-map
         ("gcc" . evilnc-comment-or-uncomment-lines)
         :map evil-visual-state-map
         ("gc" . evilnc-comment-or-uncomment-lines)))

(use-package windmove
  :ensure nil)

(use-package emacs
  :bind
  (("C-c r" . revert-buffer))
  :custom
  ;; hide commands in M-x which do not apply to the current mode
  (read-extended-command-predicate #'command-completion-default-include-p))

;; LSP
(use-package eglot
  :ensure nil
  :hook ((go-mode . eglot-ensure)
         (go-ts-mode . eglot-ensure)
         (typescript-ts-mode . eglot-ensure)
         (tsx-ts-mode . eglot-ensure)
         (js-ts-mode . eglot-ensure)
         (python-ts-mode . eglot-ensure)
         (rust-ts-mode . eglot-ensure)))

(use-package eldoc
  :ensure nil
  :init
  (global-eldoc-mode))

(setq eldoc-idle-delay 0.3)

(defun my/eldoc-pinned-doc ()
  (interactive)
  (let ((source (eldoc-doc-buffer)))
    (with-current-buffer source
      (let ((content (buffer-string)))
        (with-current-buffer (get-buffer-create "*Pinned Documentation*")
          (let ((inhibit-read-only t))
            (erase-buffer)
            (insert content)
            (goto-char (point-min))
            (special-mode))
          (display-buffer-in-side-window
           (current-buffer)
           '((side . right)
             (window-width . 0.50))))))))

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "M-k") #'my/eldoc-pinned-doc))

;; Code completion
(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (add-to-list 'completion-at-point-functions
               #'cape-file))

;; Theme
(add-to-list 'custom-theme-load-path
             (expand-file-name "themes/" user-emacs-directory))

(load-theme 'ayu-dark t)
